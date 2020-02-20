# typed: true
# frozen_string_literal: true

module LeetCode
  # 49. Group Anagrams
  module LC49
    # Description:
    # Given an array of strings, group anagrams together.
    #
    # Examples:
    # Input: ["eat", "tea", "tan", "ate", "nat", "bat"]
    # Output: [
    #   ["ate", "eat", "tea"],
    #   ["nat", "tan"],
    #   ["bat"]
    # ]
    #
    # @param list {Array<String>}
    # @return {Array<Array<String>>}
    def group_anagrams(list)
      list.group_by { |s| s.chars.sort }.values
    end
  end
end
