# frozen_string_literal: true

module LeetCode
  # 79. Word Search
  module LC79
    def word_exists_recurse(board, row, col, word)
      return true if word.empty?

      return false unless (0...board.length).cover?(row)
      return false unless (0...board[row].length).cover?(col)
      return false if board[row][col] != word[0]

      tmp = board[row][col]
      board[row][col] = nil

      next_word = word[1..]

      return true if word_exists_recurse(board, row + 1, col, next_word)
      return true if word_exists_recurse(board, row - 1, col, next_word)
      return true if word_exists_recurse(board, row, col + 1, next_word)
      return true if word_exists_recurse(board, row, col - 1, next_word)

      board[row][col] = tmp

      false
    end

    # Description:
    # Given a 2D board and a word, find if the word exists in the grid.
    # The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring.
    # The same letter cell may not be used more than once.
    #
    # Examples:
    # - 1:
    #   Input: word = "ABCCED", board = [
    #     ["A", "B", "C", "E"],
    #     ["S", "F", "C", "S"],
    #     ["A", "D", "E", "E"]
    #   ]
    #   Output: true
    #
    # - 2:
    #   Input: word = "SEE", board = [
    #     ["A", "B", "C", "E"],
    #     ["S", "F", "C", "S"],
    #     ["A", "D", "E", "E"]
    #   ]
    #   Output: true
    #
    # - 3:
    #   Input: word = "ABCB", board = [
    #     ["A", "B", "C", "E"],
    #     ["S", "F", "C", "S"],
    #     ["A", "D", "E", "E"]
    #   ]
    #   Output: false
    #
    # @param board {Array<Array<String>>}
    # @param word {String}
    # @return {Boolean}
    def word_exists?(board, word)
      (0...board.length).each { |row|
        (0...board[row].length).each { |col|
          return true if word_exists_recurse(board, row, col, word)
        }
      }

      false
    end

    alias_method(:exist, :word_exists?)
  end
end
