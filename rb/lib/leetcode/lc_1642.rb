# frozen_string_literal: true

module LeetCode
  # 1642. Furthest Building You Can Reach
  module LC1642
    MinHeap = Helpers::LeetCode::MinHeap

    # Description:
    # You are given an integer array heights representing the heights of buildings, some bricks, and some ladders.
    # You start your journey from building 0 and move to the next building by possibly using bricks or ladders.
    #
    # While moving from building i to building i+1 (0-indexed),
    # - If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
    # - If the current building's height is less than the next building's height, you can either use one ladder or (h[i+1] - h[i]) bricks.
    #
    # Return the furthest building index (0-indexed) you can reach if you use the given ladders and bricks optimally.
    #
    # Examples:
    # Input: heights = [4, 2, 7, 6, 9, 14, 12], bricks = 5, ladders = 1
    # Output: 4
    #
    # Input: heights = [4, 12, 2, 7, 3, 18, 20, 3, 19], bricks = 10, ladders = 2
    # Output: 7
    #
    # Input: heights = [14, 3, 19, 3], bricks = 17, ladders = 0
    # Output: 3
    #
    # @param {Array<Integer>} heights
    # @param {Integer} bricks
    # @param {Integer} ladders
    # @return {Integer}
    def furthest_building(heights, bricks, ladders)
      heap = MinHeap.new

      (0...(heights.length - 1)).each { |i|
        difference = heights[i + 1] - heights[i]
        next if difference <= 0

        heap.push(difference)
        bricks -= heap.pop if heap.size > ladders

        return i if bricks < 0
      }

      heights.length - 1
    end
  end
end
