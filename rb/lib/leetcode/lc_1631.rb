# frozen_string_literal: true

module LeetCode
  # 1631. Path With Minimum Effort
  module LC1631
    Heap = Helpers::LeetCode::Heap

    # Description:
    # You are a hiker preparing for an upcoming hike.
    # You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col).
    # You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed).
    # You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.
    #
    # A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.
    #
    # Return the minimum effort required to travel from the top-left cell to the bottom-right cell.
    #
    # Examples:
    # Input: heights = [[1, 2, 2], [3, 8, 2], [5, 3, 5]]
    # Output: 2
    #
    # Input: heights = [[1, 2, 3], [3, 8, 4], [5, 3, 5]]
    # Output: 1
    #
    # Input: heights = [[1, 2, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 2, 1, 2, 1], [1, 1, 1, 2, 1]]
    # Output: 0
    #
    # @param {Array<Array<Integer>>} heights
    # @return {Integer}
    def minimum_effort_path(heights)
      r = heights.length
      c = heights[0].length
      n = r * c

      dirs = [-1, 1, -c, c]

      return 0 if r == 1 && c == 1
      return (1...r).reduce(-Float::INFINITY) { |max, i| [max, (heights[i][0] - heights[i - 1][0]).abs].max } if c == 1
      return (1...c).reduce(-Float::INFINITY) { |max, i| [max, (heights[0][i] - heights[0][i - 1]).abs].max } if r == 1

      visited = Array.new(n, false)

      differences = Array.new(n) { |i| i == 0 ? 0 : Float::INFINITY }
      heap = Heap.new([[0, differences[0]]]) { |a, b| b[1] <=> a[1] }

      until heap.empty?
        node, difference = heap.pop

        next if visited[node]
        visited[node] = true

        dirs.each { |dir|
          next if node + dir < 0 || node + dir >= n || (node % c == 0 && dir == -1) || (node % c == c - 1 && dir == 1)

          neighbor = node + dir

          node_r, node_c = node / c, node % c
          neighbor_r, neighbor_c = neighbor / c, neighbor % c

          neighbor_difference = [difference, (heights[node_r][node_c] - heights[neighbor_r][neighbor_c]).abs].max

          if neighbor_difference < differences[neighbor]
            differences[neighbor] = neighbor_difference
            heap.push([neighbor, neighbor_difference])
          end
        }
      end

      differences[-1]
    end
  end
end
