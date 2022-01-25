# frozen_string_literal: true

module LeetCode
  # 49. Group Anagrams
  module LC49
    # Description:
    # Given an array of strings strs, group the anagrams together.
    # You can return the answer in any order.
    #
    # An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
    # typically using all the original letters exactly once.
    #
    # Examples:
    # Input: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
    # Output: [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
    #
    # Input: strs = [""]
    # Output: [[""]]
    #
    # Input: strs = ["a"]
    # Output: [["a"]]
    #
    # @param {Array<String>} strs
    # @return {Array<Array<String>>}
    def group_anagrams(strs)
      strs.group_by { |str| str.chars.sort }.values
    end
  end
end
