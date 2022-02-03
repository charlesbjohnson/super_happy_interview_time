# frozen_string_literal: true

module LeetCode
  # 84. Largest Rectangle in Histogram
  module LC84
    # Description:
    # Given an array of integers heights representing the histogram's bar height where the width of each bar is 1,
    # return the area of the largest rectangle in the histogram.
    #
    # Examples:
    # Input: heights = [2, 1, 5, 6, 2, 3]
    # Output: 10
    #
    # Input: heights = [2, 4]
    # Output: 4
    #
    # @param {Array<Integer>} heights
    # @return {Integer}
    def largest_rectangle_area(heights)
      max = 0
      stack = []

      (0...heights.length).each { |i|
        h = heights[i]
        p_i = i

        while !stack.empty? && stack[-1][1] > h
          p_i, p_h = stack.pop
          max = [max, (p_h * (i - p_i))].max
        end

        stack.push([p_i, h])
      }

      until stack.empty?
        i, h = stack.pop
        max = [max, (h * (heights.length - i))].max
      end

      max
    end
  end
end
