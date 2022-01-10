# frozen_string_literal: true

module LeetCode
  # 14. Longest Common Prefix
  module LC14
    # Description:
    # Write a function to find the longest common prefix string amongst an array of strings.
    #
    # If there is no common prefix, return an empty string "".
    #
    # Examples:
    # Input: strs = ["flower", "flow", "flight"]
    # Output: "fl"
    #
    # Input: strs = ["dog", "racecar", "car"]
    # Output: ""
    #
    # @param {Array<String>} strs
    # @return {String}
    def longest_common_prefix(strs)
      return strs[0] if strs.length == 1

      i = 1
      j = 0

      while i < strs.length && j < strs[i].length
        while i < strs.length
          if strs[i][j] != strs[i - 1][j]
            break
          else
            i += 1
          end
        end

        break if i < strs.length

        i = 1
        j += 1
      end

      strs[0][...j]
    end
  end
end
