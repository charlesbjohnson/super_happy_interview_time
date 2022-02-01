# frozen_string_literal: true

module LeetCode
  # 1046. Last Stone Weight
  module LC1046
    MaxHeap = Helpers::LeetCode::MaxHeap

    # Description:
    # You are given an array of integers stones where stones[i] is the weight of the ith stone.
    #
    # We are playing a game with the stones. On each turn, we choose the heaviest two stones and smash them together.
    # Suppose the heaviest two stones have weights x and y with x <= y. The result of this smash is:
    # - If x == y, both stones are destroyed, and
    # - If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
    # - At the end of the game, there is at most one stone left.
    #
    # Return the smallest possible weight of the left stone. If there are no stones left, return 0.
    #
    # Examples:
    # Input: stones = [2, 7, 4, 1, 8, 1]
    # Output: 1
    #
    # Input: stones = [1]
    # Output: 1
    #
    # @param {Array<Integer>} stones
    # @return {Integer}
    def last_stone_weight(stones)
      heap = MaxHeap.new(stones)

      while heap.size > 1
        x, y = heap.pop, heap.pop
        heap.push((x - y).abs) if x != y
      end

      heap.size == 1 ? heap.max : 0
    end
  end
end
