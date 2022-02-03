# frozen_string_literal: true

module LeetCode
  # 218. The Skyline Problem
  module LC218
    MaxHeap = Helpers::LeetCode::MaxHeap

    # Description:
    # A city's skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance.
    # Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively.
    #
    # The geometric information of each building is given in the array buildings where buildings[i] = [lefti, righti, heighti]:
    # - lefti is the x coordinate of the left edge of the ith building.
    # - righti is the x coordinate of the right edge of the ith building.
    # - heighti is the height of the ith building.
    # - You may assume all buildings are perfect rectangles grounded on an absolutely flat surface at height 0.
    #
    # The skyline should be represented as a list of "key points" sorted by their x-coordinate in the form [[x1,y1],[x2,y2],...].
    # Each key point is the left endpoint of some horizontal segment in the skyline except the last point in the list,
    # which always has a y-coordinate 0 and is used to mark the skyline's termination where the rightmost building ends.
    # Any ground between the leftmost and rightmost buildings should be part of the skyline's contour.
    #
    # Note: There must be no consecutive horizontal lines of equal height in the output skyline.
    # For instance, [..., [2, 3], [4, 5], [7, 5], [11, 5], [12, 7], ...] is not acceptable;
    # the three lines of height 5 should be merged into one in the final output as such: [..., [2, 3], [4, 5], [12, 7], ...]
    #
    # Examples:
    # Input: buildings = [[2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8]]
    # Output: [[2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0]]
    #
    # Input: buildings = [[0, 2, 3], [2, 5, 3]]
    # Output: [[0, 3], [5, 0]]
    #
    # @param {Array<Array<Integer>>} buildings
    # @return {Array<Array<Integer>>}
    def get_skyline(buildings)
      result = []

      points = Hash.new { |h, k| h[k] = [] }
      buildings.each { |l, r, y|
        points[l].push([:+, y])
        points[r].push([:-, y])
      }

      heap = MaxHeap.new([0])
      points.sort.each { |x, ys|
        ys.each { |t, y|
          if t == :+
            heap.push(y)
          else
            heap.delete(y)
          end
        }

        result.push([x, heap.max]) if result.empty? || heap.max != result[-1][1]
      }

      result
    end
  end
end
