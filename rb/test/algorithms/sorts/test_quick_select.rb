# frozen_string_literal: true

require("config")
require("algorithms/sorts/quick_select")

module Algorithms
  module Sorts
    describe(QuickSelect) {
      subject { QuickSelect }

      it { _(subject).must_respond_to(:select) }

      describe(".select") {
        def subject(i, a)
          super().select(i, a)
        end

        it("returns ith element when odd length") {
          assert_equal(-3, subject(2, [56, 59, 94, 45, -11, -71, 15, 0, -3]))
        }

        it("returns ith element when even length") {
          assert_equal(93, subject(8, [-45, -81, 55, 23, 96, 93, -57, 21, 41, -72]))
        }

        it("returns ith largest element when duplicates") {
          assert_equal(16, subject(6, [-75, -41, -4, -4, 0, 3, 16, 16, 33, 60, 60, 88]))
        }

        it("returns nil when invalid") {
          assert_nil(subject(4, [9, -6, 2]))
          assert_nil(subject(-3, [9, 15, -3, 4]))
        }

        it("returns nil when empty array") {
          assert_nil(subject(3, []))
        }
      }
    }
  end
end
