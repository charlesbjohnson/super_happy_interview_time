# frozen_string_literal: true

module LeetCode
  # 380. Insert Delete GetRandom O(1)
  module LC380
    # Description:
    # Design a data structure that supports all following operations in average O(1) time.
    # - insert(val): Inserts an item val to the set if not already present.
    # - remove(val): Removes an item val from the set if present.
    # - getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
    class RandomizedSet
      def initialize
        @map = {}
        @list = []
        @length = 0
      end

      def insert(val)
        return false if @map[val]

        @list[@length] = val
        @map[val] = @length

        @length += 1

        true
      end

      def remove(val)
        i = @map[val]
        return false unless i

        if i != @length - 1
          @list[i] = @list[@length - 1]
          @map[@list[i]] = i
        end

        @list[@length - 1] = nil
        @map.delete(val)
        @length -= 1

        true
      end

      def random
        @list[rand(0...@length)]
      end

      alias_method(:get_random, :random)
    end
  end
end
