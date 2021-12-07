# frozen_string_literal: true

require("config")
require("leetcode/lc_155")

module LeetCode
  class TestLC155 < Minitest::Test
    include(LC155)

    def test_min_stack
      stack = MinStack.new

      assert_nil(stack.pop)
      assert_nil(stack.top)
      assert_nil(stack.min)

      assert_nil(stack.push(1))
      assert_equal(1, stack.top)
      assert_equal(1, stack.min)

      assert_nil(stack.push(2))
      assert_equal(2, stack.top)
      assert_equal(1, stack.min)

      assert_nil(stack.push(0))
      assert_equal(0, stack.top)
      assert_equal(0, stack.min)

      assert_nil(stack.pop)
      assert_equal(2, stack.top)
      assert_equal(1, stack.min)

      assert_nil(stack.pop)
      assert_equal(1, stack.top)
      assert_equal(1, stack.min)

      assert_nil(stack.pop)
      assert_nil(stack.top)
      assert_nil(stack.min)
    end
  end
end
