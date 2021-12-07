# frozen_string_literal: true

module LeetCode
  # 11. Container With Most Water
  module LC11
    # Description:
    # Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai).
    # n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
    # Find two lines, which together with x-axis forms a container, such that the container contains the most water.
    #
    # Notes:
    # - You may not slant the container.
    # - n is at least 2.
    #
    # @param heights {Array<Integer>}
    # @return {Integer}
    def max_area(heights)
      area = 0

      left = 0
      right = heights.length - 1

      while left < right
        shorter = [heights[left], heights[right]].min
        area = [area, shorter * (right - left)].max

        if heights[left] == shorter
          left += 1
        else
          right -= 1
        end
      end

      area
    end
  end
end
