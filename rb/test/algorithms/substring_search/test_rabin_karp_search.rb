# frozen_string_literal: true

require("config")
require("algorithms/substring_search/rabin_karp_search")

require_relative("./shared_behavior")

describe(Algorithms::SubstringSearch::RabinKarpSearch) {
  subject { Algorithms::SubstringSearch::RabinKarpSearch }

  it { _(subject).must_respond_to(:search) }

  describe(".search") {
    def subject(string, substring)
      super().search(string, substring)
    end

    include(Algorithms::SubstringSearch::SharedBehavior)
  }
}
