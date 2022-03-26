# frozen_string_literal: true

module LeetCode
  # 79. Word Search
  module LC79
    # Description:
    # Given an m x n grid of characters board and a string word, return true if word exists in the grid.
    #
    # The word can be constructed from letters of sequentially adjacent cells,
    # where adjacent cells are horizontally or vertically neighboring.
    #
    # The same letter cell may not be used more than once.
    #
    # Examples:
    # Input: board = [
    #   ["A", "B", "C", "E"],
    #   ["S", "F", "C", "S"],
    #   ["A", "D", "E", "E"]
    # ],
    # word = "ABCCED"
    # Output: true
    #
    # Input: board = [
    #   ["A", "B", "C", "E"],
    #   ["S", "F", "C", "S"],
    #   ["A", "D", "E", "E"]
    # ],
    # word = "SEE"
    # Output: true
    #
    # Input: board = [
    #   ["A", "B", "C", "E"],
    #   ["S", "F", "C", "S"],
    #   ["A", "D", "E", "E"]
    # ],
    # word = "ABCB"
    # Output: false
    #
    # @param {Array<Array<String>>} board
    # @param {String} word
    # @return {Boolean}
    def exist(board, word)
      result = private_methods.grep(/^exist_\d+$/).map { |m|
        send(m, Marshal.load(Marshal.dump(board)), word)
      }.uniq

      result.length == 1 ? result[0] : raise
    end

    private

    def exist_1(board, word)
      rows = board.length
      cols = board[0].length

      visited = Set.new

      rec = ->(r, c, i) {
        return true if i == word.length

        key = [r, c]

        return false if r < 0 || r >= rows
        return false if c < 0 || c >= cols
        return false if board[r][c] != word[i]
        return false if visited.include?(key)

        visited.add(key)

        return true if rec.call(r - 1, c, i + 1)
        return true if rec.call(r, c + 1, i + 1)
        return true if rec.call(r + 1, c, i + 1)
        return true if rec.call(r, c - 1, i + 1)

        visited.delete(key)
        false
      }

      (0...rows).any? { |r|
        (0...cols).any? { |c|
          rec.call(r, c, 0)
        }
      }
    end

    def exist_2(board, word)
      rows = board.length
      cols = board[0].length

      visited = Set.new

      iter = ->(stack) {
        until stack.empty?
          r, c, i, backtrack = stack.pop

          key = [r, c]

          if backtrack
            visited.delete(key)
            next
          end

          return true if i == word.length

          next if r < 0 || r >= rows
          next if c < 0 || c >= cols
          next if board[r][c] != word[i]
          next if visited.include?(key)

          visited.add(key)

          stack.push([r, c, i, true])
          stack.push([r, c - 1, i + 1, false])
          stack.push([r + 1, c, i + 1, false])
          stack.push([r, c + 1, i + 1, false])
          stack.push([r - 1, c, i + 1, false])
        end

        false
      }

      (0...rows).any? { |r|
        (0...cols).any? { |c|
          iter.call([[r, c, 0]])
        }
      }
    end
  end
end
