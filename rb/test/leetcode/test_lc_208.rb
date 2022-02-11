# frozen_string_literal: true

require("config")
require("leetcode/lc_208")

module LeetCode
  class TestLC208 < Minitest::Test
    include(LC208)

    [
      [
        [:insert, ["apple"], nil],
        [:search, ["apple"], true],
        [:search, ["app"], false],
        [:starts_with, ["app"], true],
        [:insert, ["app"], nil],
        [:search, ["app"], true]
      ]
    ].each.with_index { |steps, i|
      define_method(:"test_trie_#{i}") {
        subject = Trie.new
        steps.each { |method, args, expected|
          if expected.nil?
            assert_nil(subject.send(method, *args))
          else
            assert_equal(expected, subject.send(method, *args))
          end
        }
      }
    }
  end
end
