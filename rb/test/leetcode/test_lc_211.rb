# frozen_string_literal: true

require("config")
require("leetcode/lc_211")

module LeetCode
  class TestLC211 < Minitest::Test
    include(LC211)

    [
      [
        [:add_word, ["bad"], nil],
        [:add_word, ["dad"], nil],
        [:add_word, ["mad"], nil],
        [:search, ["pad"], false],
        [:search, ["bad"], true],
        [:search, [".ad"], true],
        [:search, ["b.."], true]
      ]
    ].each.with_index { |steps, i|
      define_method(:"test_word_dictionary_#{i}") {
        subject = WordDictionary.new
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
