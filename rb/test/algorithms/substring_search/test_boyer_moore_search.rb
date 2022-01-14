# frozen_string_literal: true

require("config")
require("algorithms/substring_search/boyer_moore_search")

require_relative("./shared_behavior")

describe(Algorithms::SubstringSearch::BoyerMooreSearch) {
  subject { Algorithms::SubstringSearch::BoyerMooreSearch }

  it { _(subject).must_respond_to(:search) }

  describe(".search") {
    def subject(string, substring)
      super().search(string, substring)
    end

    include(Algorithms::SubstringSearch::SharedBehavior)
  }
}
