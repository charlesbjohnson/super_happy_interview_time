# frozen_string_literal: true

require("config")
require("algorithms/sorts/top_down_merge_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    describe(TopDownMergeSort) {
      subject { TopDownMergeSort }

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
