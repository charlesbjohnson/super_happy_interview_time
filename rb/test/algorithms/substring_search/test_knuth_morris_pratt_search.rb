# frozen_string_literal: true

require("config")
require("algorithms/substring_search/knuth_morris_pratt_search")

require_relative("./shared_behavior")

module Algorithms
  module SubstringSearch
    describe(KnuthMorrisPrattSearch) {
      subject { KnuthMorrisPrattSearch }

      it { _(subject).must_respond_to(:search) }

      describe(".search") {
        def subject(string, substring)
          super().search(string, substring)
        end

        include(SharedBehavior)
      }
    }
  end
end
