# frozen_string_literal: true

module LeetCode
  # 380. Insert Delete GetRandom O(1)
  module LC380
    # Description:
    # Implement the RandomizedSet class:
    # - RandomizedSet()      Initializes the RandomizedSet object.
    # - bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
    # - bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
    # - int getRandom()      Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
    #
    # You must implement the functions of the class such that each function works in average O(1) time complexity.
    #
    # Examples:
    # Input:
    # ["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
    # [[], [1], [2], [2], [], [1], [2], []]
    # Output:
    # [null, true, false, true, 2, true, false, 2]
    #
    class RandomizedSet
      def initialize
        self.hash = {}
        self.list = []
      end

      # @param {Integer} val
      # @return {Boolean}
      def insert(val)
        return false if hash.key?(val)

        hash[val] = list.length
        list.push(val)

        true
      end

      # @param {Integer} val
      # @return {Boolean}
      def remove(val)
        return false if !hash.key?(val)

        i = hash[val]
        j = list.length - 1

        if i < j
          hash[list[j]] = i
          list[i] = list[j]
        end

        hash.delete(val)
        list.pop

        true
      end

      # @return {Integer}
      def get_random
        list[Random.random_number(0...list.length)]
      end

      private

      attr_accessor(:hash, :list)
    end
  end
end
