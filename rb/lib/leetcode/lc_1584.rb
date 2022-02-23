# frozen_string_literal: true

module LeetCode
  # 1584. Min Cost to Connect All Points
  module LC1584
    Heap = Helpers::LeetCode::Heap

    # Description:
    # You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].
    # The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.
    #
    # Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.
    #
    # Examples:
    # Input: points = [[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]]
    # Output: 20
    #
    # Input: points = [[3, 12], [-2, 5], [-4, 1]]
    # Output: 18
    #
    # @param {Array<Array<(Integer, Integer)>>} points
    # @return {Integer}
    def min_cost_connect_points(points)
      result = 0

      heap = Heap.new([[0, 0]]) { |a, b| b[1] <=> a[1] }
      visited = Array.new(points.length, false)
      count = 0

      while count < points.length
        i, d = heap.pop

        next if visited[i]
        visited[i] = true

        result += d
        count += 1

        points.each_index { |j|
          if !visited[j]
            heap.push([j, (points[i][0] - points[j][0]).abs + (points[i][1] - points[j][1]).abs])
          end
        }

      end

      result
    end
  end
end
