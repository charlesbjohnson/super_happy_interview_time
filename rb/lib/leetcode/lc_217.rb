# frozen_string_literal: true

module LeetCode
  # 217. Contains Duplicate
  module LC217
    # Description:
    # Given an array of integers, find if the array contains any duplicates.
    # Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
    #
    # @param list {Array<Integer>}
    # @return {Boolean}
    def contains_duplicate(list)
      list.length != list.uniq.length
    end
  end
end
