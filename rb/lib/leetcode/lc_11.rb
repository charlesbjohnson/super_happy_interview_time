# frozen_string_literal: true

module LeetCode
  # 11. Container With Most Water
  module LC11
    # Description:
    # You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
    # Find two lines that together with the x-axis form a container, such that the container contains the most water.
    #
    # Return the maximum amount of water a container can store.
    #
    # Notice that you may not slant the container.
    #
    # Examples:
    # Input: height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    # Output: 49
    #
    # Input: height = [1, 1]
    # Output: 1
    #
    # @param {Array<Integer>} height
    # @return {Integer}
    def max_area(height)
      result = 0

      l = 0
      r = height.length - 1

      while l < r
        result = [result, [height[l], height[r]].min * (r - l)].max

        case height[l] <=> height[r]
        when -1, 0
          l += 1
        when 1
          r -= 1
        end
      end

      result
    end
  end
end
