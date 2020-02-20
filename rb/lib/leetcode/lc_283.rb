# typed: true
# frozen_string_literal: true

module LeetCode
  # 283. Move Zeroes
  module LC283
    # Description:
    # Given an array of numbers, write a function to move all 0's to the end of it
    # while maintaining the relative order of the non-zero elements.
    #
    # Examples:
    # Input: list = [0, 1, 0, 3, 12]
    # Output: nil
    # where list = [1, 3, 12, 0, 0]
    #
    # Notes:
    # - You must do this in-place without making a copy of the array.
    # - Minimize the total number of operations.
    #
    # @param list {Array<Integer>}
    # @return {nil}
    def move_zeroes(list)
      return if list.length < 2

      filler = 0
      finder = filler + 1

      while filler < list.length && finder < list.length
        unless list[filler].zero?
          filler += 1
          finder += 1
          next
        end

        if list[finder].zero?
          finder += 1
          next
        end

        list[filler] = list[finder]
        list[finder] = 0
      end

      nil
    end
  end
end
