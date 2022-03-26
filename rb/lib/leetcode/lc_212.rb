# frozen_string_literal: true

module LeetCode
  # 212. Word Search II
  module LC212
    # Description:
    # Given an m x n board of characters and a list of strings words, return all words on the board.
    #
    # Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring.
    # The same letter cell may not be used more than once in a word.
    #
    # Examples:
    # Input: board = [
    #   ["o", "a", "a", "n"],
    #   ["e", "t", "a", "e"],
    #   ["i", "h", "k", "r"],
    #   ["i", "f", "l", "v"]
    # ],
    # words = ["oath", "pea", "eat", "rain"]
    # Output: ["eat","oath"]
    #
    # Input: board = [
    #   ["a", "b"],
    #   ["c", "d"]
    # ],
    # words = ["abcb"]
    # Output: []
    #
    # @param {Array<Array<String>>} board
    # @param {Array<String>} words
    # @return {Array<String>}
    def find_words(board, words)
      rows = board.length
      cols = board[0].length

      result = Set.new

      visited = Set.new
      words = words.to_set
      root = trie(words)

      rec = ->(r, c, node) {
        key = [r, c]

        return [] if r < 0 || r >= rows
        return [] if c < 0 || c >= cols
        return [] if visited.include?(key)
        return [] if !node.children.key?(board[r][c])

        node = node.children[board[r][c]]
        visited.add(key)

        dirs = [
          rec.call(r - 1, c, node),
          rec.call(r, c + 1, node),
          rec.call(r + 1, c, node),
          rec.call(r, c - 1, node)
        ].flatten

        visited.delete(key)
        ([node.word].compact + dirs)
      }

      (0...rows).each { |r|
        (0...cols).each { |c|
          found = rec.call(r, c, root)
          if !found.empty?
            result += found
            words -= found
            root = trie(words)
          end
        }
      }

      result.to_a
    end

    private

    def trie(words)
      root = TrieNode.new

      words.each { |word|
        cursor = root
        word.each_char { |c| cursor = cursor.children[c] }
        cursor.word = word
      }

      root
    end

    TrieNode = Struct.new(:word, :children) {
      def initialize(word = nil, children = Hash.new { |h, k| h[k] = TrieNode.new })
        super
      end
    }
  end
end
