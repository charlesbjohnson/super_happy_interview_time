# frozen_string_literal: true

module LeetCode
  # 744. Find Smallest Letter Greater Than Target
  module LC744
    # Description:
    # Given a characters array letters that is sorted in non-decreasing order and a character target,
    # return the smallest character in the array that is larger than target.
    #
    # Note that the letters wrap around.
    # For example, if target == 'z' and letters == ['a', 'b'], the answer is 'a'.
    #
    # Examples:
    # Input: letters = ["c", "f", "j"], target = "a"
    # Output: "c"
    #
    # Input: letters = ["c", "f", "j"], target = "c"
    # Output: "f"
    #
    # Input: letters = ["c", "f", "j"], target = "d"
    # Output: "f"
    #
    # @param {Array<String>} letters
    # @param {String} target
    # @return {String}
    def next_greatest_letter(letters, target)
      lo = 0
      hi = letters.length - 1

      while lo < hi
        mid = ((hi - lo) / 2) + lo

        case target <=> letters[mid]
        when -1
          hi = mid
        when 0, 1
          lo = mid + 1
        end
      end

      letters[lo] <= target ? letters[0] : letters[lo]
    end
  end
end
