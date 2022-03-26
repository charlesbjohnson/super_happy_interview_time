# frozen_string_literal: true

module LeetCode
  # 720. Longest Word in Dictionary
  module LC720
    # Description:
    # Given an array of strings words representing an English Dictionary,
    # return the longest word in words that can be built one character at a time by other words in words.
    #
    # If there is more than one possible answer, return the longest word with the smallest lexicographical order.
    # If there is no answer, return the empty string.
    #
    # Examples:
    # Input: words = ["w", "wo", "wor", "worl", "world"]
    # Output: "world"
    #
    # Input: words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
    # Output: "apple"
    #
    # @param {Array<String>} words
    # @return {String}
    def longest_word(words)
      result = private_methods.grep(/^longest_word_\d+$/).map { |m| send(m, words) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def longest_word_1(words)
      result = ""

      root = TrieNode.new
      words.each { |word|
        cursor = root
        word.each_char { |c| cursor = cursor.children[c] }
        cursor.word = word
      }

      rec = ->(node) {
        node.children.each_value { |child|
          if child.word
            result = case result.length <=> child.word.length
            when -1
              child.word
            when 0
              result < child.word ? result : child.word
            else
              result
            end

            rec.call(child)
          end
        }
      }

      rec.call(root)
      result
    end

    def longest_word_2(words)
      result = ""

      root = TrieNode.new
      words.each { |word|
        cursor = root
        word.each_char { |c| cursor = cursor.children[c] }
        cursor.word = word
      }

      stack = [root]
      until stack.empty?
        node = stack.pop

        node.children.each_value { |child|
          if child.word
            result = case result.length <=> child.word.length
            when -1
              child.word
            when 0
              result < child.word ? result : child.word
            else
              result
            end

            stack.push(child)
          end
        }
      end

      result
    end

    TrieNode = Struct.new(:word, :children) {
      def initialize(word = nil, children = Hash.new { |h, k| h[k] = TrieNode.new })
        super
      end
    }
  end
end
