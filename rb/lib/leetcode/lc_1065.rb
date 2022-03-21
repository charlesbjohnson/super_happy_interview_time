# frozen_string_literal: true

module LeetCode
  # 1065. Index Pairs of a String
  module LC1065
    # Description:
    # Given a string text and an array of strings words,
    # return an array of all index pairs [i, j] so that the substring text[i...j] is in words.
    #
    # Return the pairs [i, j] in sorted order
    # (i.e., sort them by their first coordinate, and in case of ties sort them by their second coordinate).
    #
    # Examples:
    # Input: text = "thestoryofleetcodeandme", words = ["story", "fleet", "leetcode"]
    # Output: [[3, 7], [9, 13], [10, 17]]
    #
    # Input: text = "ababa", words = ["aba", "ab"]
    # Output: [[0, 1], [0, 2], [2, 3], [2, 4]]
    #
    # @param {String} text
    # @param {Array<String>} words
    # @return {Array<Array<(Integer, Integer)>>}
    def index_pairs(text, words)
      result = []
      trie = Trie.new(words)

      (0...text.length).each { |i|
        trie.search(text[i..]).each { |word|
          result.push([i, i + word.length - 1])
        }
      }

      result
    end

    private

    class Trie
      def initialize(words)
        self.root = TrieNode.new

        words.each { |word|
          cursor = root
          word.each_char { |c| cursor = cursor.children[c] }
          cursor.word = word
        }
      end

      def search(s)
        result = []
        cursor = root

        (0...s.length).each { |i|
          break if !cursor.children.key?(s[i])
          cursor = cursor.children[s[i]]
          result.push(cursor.word) if cursor.word
        }

        result
      end

      private

      attr_accessor(:root)

      TrieNode = Struct.new(:word, :children) {
        def initialize(word = nil, children = Hash.new { |h, k| h[k] = TrieNode.new })
          super
        end
      }
    end
  end
end
