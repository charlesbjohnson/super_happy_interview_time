# frozen_string_literal: true

module LeetCode
  # 417. Pacific Atlantic Water Flow
  module LC417
    # Description:
    # There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean.
    # The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.
    #
    # The island is partitioned into a grid of square cells.
    # You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).
    #
    # The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west
    # if the neighboring cell's height is less than or equal to the current cell's height.
    # Water can flow from any cell adjacent to an ocean into the ocean.
    #
    # Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci)
    # to both the Pacific and Atlantic oceans.
    #
    # Examples:
    # heights = [
    #   [1, 2, 2, 3, 5],
    #   [3, 2, 3, 4, 4],
    #   [2, 4, 5, 3, 1],
    #   [6, 7, 1, 4, 5],
    #   [5, 1, 1, 2, 4]
    # ]
    # Output: [[0, 4], [1, 3], [1, 4], [2, 2], [3, 0], [3, 1], [4, 0]]
    #
    # Input: heights = [
    #   [2, 1],
    #   [1, 2]
    # ]
    # Output: [[0, 0], [0, 1], [1, 0], [1, 1]]
    #
    # @param {Array<Array<Integer>>} heights
    # @return {Array<Array<Integer>>}
    def pacific_atlantic(heights)
      rows = heights.length
      cols = heights[0].length

      search = ->(queue) {
        set = Set.new

        until queue.empty?
          r, c = queue.shift

          next if !set.add?([r, c])

          queue.push([r - 1, c]) if r - 1 >= 0 && heights[r][c] <= heights[r - 1][c] && !set.include?([r - 1, c])
          queue.push([r, c + 1]) if c + 1 < cols && heights[r][c] <= heights[r][c + 1] && !set.include?([r, c + 1])
          queue.push([r + 1, c]) if r + 1 < rows && heights[r][c] <= heights[r + 1][c] && !set.include?([r + 1, c])
          queue.push([r, c - 1]) if c - 1 >= 0 && heights[r][c] <= heights[r][c - 1] && !set.include?([r, c - 1])
        end

        set
      }

      queue_p = []
      queue_a = []

      (0...rows).each { |r|
        queue_p.push([r, 0])
        queue_a.push([r, cols - 1])
      }

      (0...cols).each { |c|
        queue_p.push([0, c])
        queue_a.push([rows - 1, c])
      }

      (search.call(queue_p) & search.call(queue_a)).to_a
    end
  end
end
