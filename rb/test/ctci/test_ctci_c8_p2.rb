# frozen_string_literal: true

require("config")
require("ctci/ctci_c8_p2")

module CTCI
  module C8
    module P2
      describe(CallCenter) {
        subject { CallCenter.new }

        it { _(subject).must_respond_to(:dispatch_call) }
        it { _(subject).must_respond_to(:add_staff) }

        describe("#add_staff") {
          let(:respondent) { StaffMember.respondent }
          it("adds the staff member as an available staff") {
            staff = subject.instance_variable_get(:@staff)
            _(staff.values.map(&:values).flatten).must_be_empty

            actual = subject.add_staff(respondent)

            _(staff[respondent.support_role][:available]).must_include(respondent)
            _(staff[respondent.support_role][:unavailable]).wont_include(respondent)
            _(actual).must_equal(respondent)
          }

          it("adds the call center as an observer of the staff member") {
            _(respondent.count_observers).must_equal(0)
            subject.add_staff(respondent)
            _(respondent.count_observers).must_equal(1)
          }
        }

        describe("#dispatch_call") {
          before {
            @respondent = subject.add_staff(StaffMember.respondent)
            @manager = subject.add_staff(StaffMember.manager)
            @director = subject.add_staff(StaffMember.director)
            @call = Call.new
          }

          describe("if a respondent is available") {
            it("connects the call with a staff member") {
              subject.dispatch_call(@call)
              _(@respondent.current_call).must_equal(@call)
            }

            it("connects the call with a staff member who is capable") {
              @call.escalate_issue
              subject.dispatch_call(@call)
              _(@manager.current_call).must_equal(@call)
            }

            describe("the call requires respondent with higher support tier") {
              before {
                manager_call = Call.new(&:escalate_issue)
                director_call = Call.new { |c| 2.times { c.escalate_issue } }
                subject.dispatch_call(@call)
                subject.dispatch_call(manager_call)
                subject.dispatch_call(director_call)
              }

              it("the call is added to the waiting list") {
                @respondent.reassign_call
                _(subject.instance_variable_get(:@wait_list)).must_include(@call)
              }

              it("returns the original respondent to the available staff") {
                @respondent.reassign_call

                staff = subject.instance_variable_get(:@staff)
                _(staff[@respondent.support_role][:unavailable]).wont_include(@respondent)
                _(staff[@respondent.support_role][:available]).must_include(@respondent)
              }

              describe("other calls waiting") {
                before {
                  @other_call = Call.new
                  subject.dispatch_call(@other_call)
                }

                it("dispatches the first waiting call") {
                  @respondent.reassign_call
                  _(@respondent.current_call).must_equal(@other_call)
                }
              }
            }
          }

          describe("if no staff member is available") {
            before { subject.dispatch_call(@call) }

            it("queues the call until a staff member is available") {
              other_call = Call.new
              subject.dispatch_call(other_call)

              _(other_call).wont_be(:connected?)
              _(other_call.respondent).must_be_nil
              _(subject.instance_variable_get(:@wait_list)).must_include(other_call)
            }
          }
        }
      }

      describe(Call) {
        subject { Call.new }

        it { _(subject).must_respond_to(:connect) }
        it { _(subject).must_respond_to(:disconnect) }
        it { _(subject).must_respond_to(:connected?) }
        it { _(subject).must_respond_to(:respondent) }
        it { _(subject).must_respond_to(:level) }
        it { _(subject).must_respond_to(:escalate_issue) }

        let(:respondent) { StaffMember.respondent }

        it("starts out disconnected") {
          _(subject).wont_be(:connected?)
          _(subject.respondent).must_be_nil
        }

        describe("#connect") {
          it("connects the call with a respondent") {
            subject.connect(respondent)
            _(subject).must_be(:connected?)
            _(subject.respondent).must_equal(respondent)
          }
        }

        describe("#disconnect") {
          before { subject.connect(respondent) }

          it("disconnects the call from the respondent") {
            subject.disconnect
            _(subject).wont_be(:connected?)
            _(subject.respondent).must_be_nil
          }
        }

        describe("#escalate_issue") {
          it("escalates the level of the call") {
            _(subject.level).must_equal(0)
            subject.escalate_issue
            _(subject.level).must_equal(1)
          }

          it("does not escalate past level 2") {
            6.times { subject.escalate_issue }
            _(subject.level).must_equal(2)
          }
        }
      }

      describe(StaffMember) {
        subject { StaffMember.respondent }

        it { _(subject).must_respond_to(:assign_call) }
        it { _(subject).must_respond_to(:reassign_call) }
        it { _(subject).must_respond_to(:current_call) }

        it {
          _(StaffMember.respondent.support_role).must_equal(:respondent)
          _(StaffMember.manager.support_role).must_equal(:manager)
          _(StaffMember.director.support_role).must_equal(:director)
        }

        let(:call) { Call.new }

        describe("#assign_call") {
          it {
            subject.assign_call(call)
            _(subject.current_call).must_equal(call)
            _(call).must_be(:connected?)
            _(call.respondent).must_equal(subject)
          }
        }

        describe("#reassign_call") {
          before {
            subject.assign_call(call)
          }

          it("notifies observers") {
            call_center = Minitest::Mock.new

            def call_center.hash
              Object.new.hash
            end

            call_center.expect(:update, nil, [subject, call])
            subject.add_observer(call_center)
            subject.reassign_call

            call_center.verify
          }

          it("escalates the call") {
            _(subject.current_call.level).must_equal(0)
            subject.reassign_call
            _(call.level).must_equal(1)
          }

          it("disconnects the call") {
            subject.reassign_call
            _(call).wont_be(:connected?)
            _(subject.current_call).must_be_nil
          }
        }
      }
    end
  end
end
