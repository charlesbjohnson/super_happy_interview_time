# typed: true
# frozen_string_literal: true

require("config")
require("leetcode/lc_461")

module LeetCode
  class TestLC461 < Minitest::Test
    include(LC461)

    def test_hamming_distance
      assert_equal(2, hamming_distance(1, 4))
    end
  end
end
