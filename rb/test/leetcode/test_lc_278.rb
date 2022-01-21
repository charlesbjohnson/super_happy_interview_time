# frozen_string_literal: true

require("config")
require("leetcode/lc_278")

module LeetCode
  class TestLC278 < Minitest::Test
    [
      [1, 1],
      [2, 1],
      [2, 2],
      [3, 1],
      [3, 2],
      [3, 3],
      [5, 4]
    ].each.with_index { |(n, bad), i|
      Class.new(Minitest::Test) {
        include(LC278)

        define_method(:is_bad_version) { |v| v >= bad }

        define_method(:"test_first_bad_version_#{i}") {
          assert_equal(bad, first_bad_version(n))
        }
      }
    }
  end
end
