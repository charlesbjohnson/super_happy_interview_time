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
    # ], words = ["oath", "pea", "eat", "rain"]
    # Output: ["eat","oath"]
    #
    # Input: board = [
    #   ["a", "b"],
    #   ["c", "d"]
    # ], words = ["abcb"]
    # Output: []
    #
    # @param {Array<Array<String>>} board
    # @param {Array<String>} words
    # @return {Array<String>}
    def find_words(board, words)
      result = Set.new

      visited = Set.new
      words = words.to_set
      root = trie(words)

      rec = ->(row, col, node) {
        key = "r#{row}c#{col}"

        return [] if row < 0 || row >= board.length || col < 0 || col >= board[row].length
        return [] if visited.include?(key)
        return [] if !node.children.key?(board[row][col])

        node = node.children[board[row][col]]
        visited.add(key)

        d = rec.call(row + 1, col, node)
        r = rec.call(row, col + 1, node)
        u = rec.call(row - 1, col, node)
        l = rec.call(row, col - 1, node)

        visited.delete(key)
        ([node.word].compact + d + r + u + l)
      }

      (0...board.length).each { |row|
        (0...board[row].length).each { |col|
          found = rec.call(row, col, root)
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
