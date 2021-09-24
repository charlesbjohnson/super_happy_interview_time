# typed: true
# frozen_string_literal: true

module LeetCode
  # 26. Remove Duplicates from Sorted Array
  module LC26
    # Description:
    # Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.
    #
    # Examples:
    # Input: list = [1, 1, 2]
    # Output: 2
    # Where list = [1, 2, ...]
    #
    # Notes:
    # - Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
    #
    # @param {Array<Integer>}
    # @return {Integer}
    def remove_duplicates(list)
      return 1 if list.length == 1

      (0...(list.length - 1)).each { |i|
        list[i] = nil if list[i] == list[i + 1]
      }

      filler = 0
      finder = filler + 1

      while filler < list.length
        if list[filler]
          filler += 1
          finder += 1
          next
        end

        break if finder >= list.length

        unless list[finder]
          finder += 1
          next
        end

        list[filler] = list[finder]
        list[finder] = nil
      end

      filler
    end
  end
end
