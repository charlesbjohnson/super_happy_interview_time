# frozen_string_literal: true

module LeetCode
  # 17. Letter Combinations of a Phone Number
  module LC17
    # Description:
    # Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
    # Return the answer in any order.
    #
    # A mapping of digit to letters (just like on the telephone buttons) is given below.
    # Note that 1 does not map to any letters.
    #
    # 1 =>      | 2 => abc | 3 => def
    # 4 => ghi  | 5 => jkl | 6 => mno
    # 7 => pqrs | 8 => tuv | 9 => wxyz
    #             0 =>
    #
    # Examples:
    # Input: digits = "23"
    # Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    #
    # Input: digits = ""
    # Output: []
    #
    # Input: digits = "2"
    # Output: ["a", "b", "c"]
    #
    # @param {String} digits
    # @return {Array<String>}
    def letter_combinations(digits)
      result = []
      keypad = {
        "2" => ["a", "b", "c"],
        "3" => ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j", "k", "l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]
      }

      stack = []
      stack.push([0, ""]) unless digits.empty?

      until stack.empty?
        i, s = stack.pop

        if i >= digits.length
          result.unshift(s)
          next
        end

        keypad[digits[i]].each { |c|
          stack.push([i + 1, s + c])
        }
      end

      result
    end
  end
end
