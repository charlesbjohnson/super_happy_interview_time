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
      result = []

      words = words.to_set
      root = trie(words)

      (0...board.length).each { |row|
        (0...board[row].length).each { |col|
          found = r_find_words(row, col, root, board, Set.new)
          if !found.empty?
            result += found.uniq
            words -= found
            root = trie(words)
          end
        }
      }

      result
    end

    private

    def r_find_words(row, col, root, board, visited)
      key = "r#{row}c#{col}"

      return [] if row < 0 || row >= board.length || col < 0 || col >= board[row].length
      return [] if visited.include?(key)
      return [] if !root.children.key?(board[row][col])

      root = root.children[board[row][col]]
      visited.add(key)

      d = r_find_words(row + 1, col, root, board, visited)
      r = r_find_words(row, col + 1, root, board, visited)
      u = r_find_words(row - 1, col, root, board, visited)
      l = r_find_words(row, col - 1, root, board, visited)

      visited.delete(key)
      ([root.word].compact + d + r + u + l)
    end

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
