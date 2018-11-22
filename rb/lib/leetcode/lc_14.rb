# frozen_string_literal: true

module LeetCode
  # 14. Longest Common Prefix
  module LC14
    def common_prefix(left, right)
      cursor = 0

      cursor += 1 while cursor < left.length && cursor < right.length && left[cursor] == right[cursor]

      left[0...cursor]
    end

    # Description:
    # Write a function to find the longest common prefix string amongst an array of strings.
    #
    # @param list {Array<String>}
    # @return {String}
    def longest_common_prefix(list)
      return '' if list.empty?
      return list.first if list.length < 2

      (1...list.length).reduce(list[0]) { |prefix, i| common_prefix(prefix, list[i]) }
    end
  end
end
