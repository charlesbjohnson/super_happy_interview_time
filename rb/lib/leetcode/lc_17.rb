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
      result = private_methods.grep(/^letter_combinations_\d+$/).map { |m| send(m, digits).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def letter_combinations_1(digits)
      return [] if digits.empty?

      mapping = {
        "2" => ["a", "b", "c"],
        "3" => ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j", "k", "l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]
      }

      rec = ->(i, combination) {
        return [combination] if i == digits.length

        mapping[digits[i]].flat_map { |c|
          rec.call(i + 1, combination + c)
        }
      }

      rec.call(0, "")
    end

    def letter_combinations_2(digits)
      result = []

      return result if digits.empty?

      stack = [[0, ""]]
      mapping = {
        "2" => ["a", "b", "c"],
        "3" => ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j", "k", "l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]
      }

      until stack.empty?
        i, combination = stack.pop

        if i == digits.length
          result.push(combination)
          next
        end

        mapping[digits[i]].reverse_each { |c|
          stack.push([i + 1, combination + c])
        }
      end

      result
    end

    def letter_combinations_3(digits)
      result = []
      combination = []

      return result if digits.empty?

      mapping = {
        "2" => ["a", "b", "c"],
        "3" => ["d", "e", "f"],
        "4" => ["g", "h", "i"],
        "5" => ["j", "k", "l"],
        "6" => ["m", "n", "o"],
        "7" => ["p", "q", "r", "s"],
        "8" => ["t", "u", "v"],
        "9" => ["w", "x", "y", "z"]
      }

      rec = ->(i) {
        if i == digits.length
          result.push(combination.join)
          return
        end

        mapping[digits[i]].each { |c|
          combination.push(c)
          rec.call(i + 1)
          combination.pop
        }
      }

      rec.call(0)
      result
    end
  end
end
