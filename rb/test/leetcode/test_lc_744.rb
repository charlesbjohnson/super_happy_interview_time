# frozen_string_literal: true

require("config")
require("leetcode/lc_744")

module LeetCode
  class TestLC744 < Minitest::Test
    include(LC744)

    [
      [[%w[c f j], "a"], "c"],
      [[%w[c f j], "c"], "f"],
      [[%w[c f j], "d"], "f"],
      [[%w[c f j], "f"], "j"],
      [[%w[c f j], "h"], "j"],
      [[%w[c f j], "z"], "c"],
      [[%w[c f j], "j"], "c"]
    ].each.with_index { |((letters, target), expected), i|
      define_method(:"test_next_greatest_letter_#{i}") {
        assert_equal(expected, next_greatest_letter(letters, target))
      }
    }
  end
end
