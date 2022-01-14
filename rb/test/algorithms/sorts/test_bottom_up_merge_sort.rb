# frozen_string_literal: true

require("config")
require("algorithms/sorts/bottom_up_merge_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    describe(BottomUpMergeSort) {
      subject { BottomUpMergeSort }

      it { _(subject).must_respond_to(:sort) }
      it { _(subject).must_respond_to(:sort!) }

      describe(".sort") {
        def subject(a)
          super().sort(a)
        end

        include(SharedBehavior::Immutable)
      }

      describe(".sort!") {
        def subject(a)
          super().sort!(a)
        end

        include(SharedBehavior::Mutable)
      }
    }
  end
end
