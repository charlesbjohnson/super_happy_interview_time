# frozen_string_literal: true

module LeetCode
  # 347. Top K Frequent Elements
  module LC347
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given an integer array nums and an integer k, return the k most frequent elements.
    # You may return the answer in any order.
    #
    # Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
    #
    # Examples:
    # Input: nums = [1, 1, 1, 2, 2, 3], k = 2
    # Output: [1, 2]
    #
    # Input: nums = [1], k = 1
    # Output: [1]
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Array<Integer>}
    def top_k_frequent(nums, k)
      result = private_methods.grep(/^top_k_frequent_\d+$/).map { |m| send(m, nums, k).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def top_k_frequent_1(nums, k)
      hash = nums.tally
      hash.each_key.sort { |a, b| hash[b] <=> hash[a] }[...k]
    end

    def top_k_frequent_2(nums, k)
      hash = nums.tally
      heap = Heap.new { |a, b| hash[a] <=> hash[b] }

      hash.each_key { |num|
        case heap.size
        when ...k
          heap.push(num)
        when k
          if hash[num] > hash[heap.peek]
            heap.push(num)
            heap.pop
          end
        end
      }

      heap.to_a
    end

    def top_k_frequent_3(nums, k)
      result = []

      hash = nums.tally
      buckets = Array.new(nums.length + 1) { [] }
      hash.each { |num, frequency| buckets[frequency].push(num) }

      i = buckets.length - 1
      j = 0

      while result.length < k
        while j >= buckets[i].length
          i -= 1
          j = 0
        end

        result.push(buckets[i][j])

        j += 1
      end

      result
    end
  end
end
