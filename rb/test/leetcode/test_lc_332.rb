# frozen_string_literal: true

require("config")
require("helpers/leetcode/map")

require("leetcode/lc_332")

module LeetCode
  class TestLC332 < Minitest::Test
    include(LC332)

    [
      [[["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]], ["JFK", "MUC", "LHR", "SFO", "SJC"]],
      [[["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]], ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"]],
      [[["EZE", "AXA"], ["TIA", "ANU"], ["ANU", "JFK"], ["JFK", "ANU"], ["ANU", "EZE"], ["TIA", "ANU"], ["AXA", "TIA"], ["TIA", "JFK"], ["ANU", "TIA"], ["JFK", "TIA"]], ["JFK", "ANU", "EZE", "AXA", "TIA", "ANU", "JFK", "TIA", "ANU", "TIA", "JFK"]]
    ].each.with_index { |(tickets, expected), i|
      define_method(:"test_find_itinerary_#{i}") {
        assert_equal(expected, find_itinerary(tickets))
      }
    }
  end
end
