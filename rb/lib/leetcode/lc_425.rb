# frozen_string_literal: true

module LeetCode
  # 425. Word Squares
  module LC425
    # Description:
    # Given an array of unique strings words, return all the word squares you can build from words.
    # The same word from words can be used multiple times. You can return the answer in any order.
    #
    # A sequence of strings forms a valid word square if the kth row and column read the same string, where 0 <= k < max(numRows, numColumns).
    #
    # - For example, the word sequence ["ball","area","lead","lady"] forms a word square because each word reads the same both horizontally and vertically.
    #
    # Examples:
    # Input: words = ["area", "lead", "wall", "lady", "ball"]
    # Output: [["ball", "area", "lead", "lady"], ["wall", "area", "lead", "lady"]]
    #
    # Input: words = ["abat", "baba", "atan", "atal"]
    # Output: [["baba", "abat", "baba", "atal"], ["baba", "abat", "baba", "atan"]]
    #
    # @param {Array<String>} words
    # @return {Array<Array<String>>}
    def word_squares(words)
      result = []

      n = words[0].length
      trie = Trie.new(words)

      rec = ->(square) {
        if square.length == n
          result.push(square)
          return
        end

        prefix = square.map { |w| w[square.length] }.join
        words = trie.words_starting_with(prefix)

        words.each { |word|
          rec.call(square + [word])
        }
      }

      rec.call([])
      result
    end

    private

    class Trie
      def initialize(words)
        self.root = TrieNode.new

        words.each { |word|
          cursor = root
          word.each_char { |char| cursor = cursor.children[char] }
          cursor.word = word
        }
      end

      def words_starting_with(prefix)
        result = []
        cursor = root

        prefix.each_char { |char|
          if cursor.children.key?(char)
            cursor = cursor.children[char]
          else
            return []
          end
        }

        rec = ->(cursor) {
          result.push(cursor.word) if cursor.word
          cursor.children.each { |_, child| rec.call(child) }
        }

        rec.call(cursor)
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
