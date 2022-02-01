# frozen_string_literal: true

module LeetCode
  # 973. K Closest Points to Origin
  module LC973
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k,
    # return the k closest points to the origin (0, 0).
    #
    # The distance between two points on the X-Y plane is the Euclidean distance (i.e., √((x1 - x2)^2 + (y1 - y2)^2)).
    #
    # You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).
    #
    # Examples:
    # Input: points = [[1, 3], [-2, 2]], k = 1
    # Output: [[-2, 2]]
    #
    # Input: points = [[3, 3], [5, -1], [-2, 4]], k = 2
    # Output: [[3, 3], [-2, 4]]
    #
    # @param {Array<Array<Integer>>} points
    # @param {Integer} k
    # @return {Array<Array<Integer>>}
    def k_closest(points, k)
      heap = Heap.new { |a, b| Math.sqrt(a[0]**2 + a[1]**2) <=> Math.sqrt(b[0]**2 + b[1]**2) }

      points.each { |point|
        heap.push(point)
        heap.pop if heap.size > k
      }

      heap.size.times.map { heap.pop }.reverse
    end
  end
end
