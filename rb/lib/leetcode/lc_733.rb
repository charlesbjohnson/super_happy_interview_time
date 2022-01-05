# frozen_string_literal: true

module LeetCode
  # 733. Flood Fill
  module LC733
    # Description:
    # An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
    #
    # You are also given three integers sr, sc, and newColor.
    # You should perform a flood fill on the image starting from the pixel image[sr][sc].
    #
    # To perform a flood fill, consider the starting pixel,
    # plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel,
    # plus any pixels connected 4-directionally to those pixels (also with the same color), and so on.
    # Replace the color of all of the aforementioned pixels with newColor.
    #
    # Return the modified image after performing the flood fill.
    #
    # Examples:
    # Input: image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]], sr = 1, sc = 1, newColor = 2
    # Output: [[2, 2, 2], [2, 2, 0], [2, 0, 1]]
    #
    # Input: image = [[0, 0, 0], [0, 0, 0]], sr = 0, sc = 0, newColor = 2
    # Output: [[2, 2, 2], [2, 2, 2]]
    #
    # @param {Array<Array<Integer>} image
    # @param {Integer} sr
    # @param {Integer} sc
    # @param {Integer} new_color
    # @return {Array<Array<Integer>>}
    def flood_fill(image, sr, sc, new_color)
      stack = []
      stack.push([sr, sc]) if image[sr][sc] != new_color

      until stack.empty?
        r, c = stack.pop

        next if image[r][c] == new_color

        stack.push([r - 1, c]) if (0...(image.length)).cover?(r - 1) && image[r - 1][c] == image[r][c]
        stack.push([r + 1, c]) if (0...(image.length)).cover?(r + 1) && image[r + 1][c] == image[r][c]
        stack.push([r, c - 1]) if (0...(image[r].length)).cover?(c - 1) && image[r][c - 1] == image[r][c]
        stack.push([r, c + 1]) if (0...(image[r].length)).cover?(c + 1) && image[r][c + 1] == image[r][c]

        image[r][c] = new_color
      end

      image
    end
  end
end
