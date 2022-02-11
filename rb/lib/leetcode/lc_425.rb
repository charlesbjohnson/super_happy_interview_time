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
      [].tap { |result|
        r_word_squares([], trie(words), result, words[0].length)
      }
    end

    private

    def r_word_squares(square, root, result, n)
      if square.length == n
        result.push(square)
        return
      end

      prefix = square.map { |w| w[square.length] }.join
      words = words_starting_with(root, prefix)

      words.each { |word|
        r_word_squares(square + [word], root, result, n)
      }
    end

    def trie(words)
      root = TrieNode.new

      words.each { |word|
        cursor = root
        word.each_char { |char| cursor = cursor.children[char] }
        cursor.word = word
      }

      root
    end

    def words_starting_with(root, prefix)
      prefix.each_char { |char|
        if root.children.key?(char)
          root = root.children[char]
        else
          return []
        end
      }

      [].tap { |result|
        r_words_starting_with(root, result)
      }
    end

    def r_words_starting_with(root, result)
      result.push(root.word) if root.word

      root.children.each { |_, child|
        r_words_starting_with(child, result)
      }
    end

    TrieNode = Struct.new(:word, :children) {
      def initialize(word = nil, children = Hash.new { |h, k| h[k] = TrieNode.new })
        super
      end
    }
  end
end
