# frozen_string_literal: true

module LeetCode
  # 75. Sort Colors
  module LC75
    # Description:
    # Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.
    # Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
    #
    # Notes:
    # - You may not use the standard library's sort function for this problem.
    #
    # @param colors {Array<Integer>}
    # @return {nil}
    def sort_colors(colors)
      counts = [0, 0, 0]

      colors.each do |color|
        counts[color] += 1
      end

      colors.each_index do |i|
        if counts[0].positive?
          colors[i] = 0
          counts[0] -= 1
          next
        end

        if counts[1].positive?
          colors[i] = 1
          counts[1] -= 1
          next
        end

        colors[i] = 2
        counts[2] -= 1
      end

      colors
    end
  end
end
