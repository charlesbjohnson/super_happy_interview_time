# frozen_string_literal: true

module LeetCode
  # 654. Maximum Binary Tree
  module LC654
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # You are given an integer array nums with no duplicates. A maximum binary tree can be built recursively from nums using the following algorithm:
    # 1. Create a root node whose value is the maximum value in nums.
    # 2. Recursively build the left subtree on the subarray prefix to the left of the maximum value.
    # 3. Recursively build the right subtree on the subarray suffix to the right of the maximum value.
    #
    # Return the maximum binary tree built from nums.
    #
    # Examples:
    # Input: nums = [3, 2, 1, 6, 0, 5]
    # Output: [6, 3, 5, null, 2, 0, null, null, 1]
    #
    # Input: nums = [3, 2, 1]
    # Output: [3, null, 2, null, 1]
    #
    # @param {Array<Integer>} nums
    # @return {TreeNode}
    def construct_maximum_binary_tree(nums)
      result = private_methods.grep(/^construct_maximum_binary_tree_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def construct_maximum_binary_tree_1(nums)
      rec = ->(lo, hi) {
        return if lo > hi

        i = lo
        j = i + 1

        while j <= hi
          i = j if nums[i] < nums[j]
          j += 1
        end

        TreeNode.new(
          nums[i],
          rec.call(lo, i - 1),
          rec.call(i + 1, hi)
        )
      }

      rec.call(0, nums.length - 1)
    end

    def construct_maximum_binary_tree_2(nums)
      hash = {}
      stack = [[0..(nums.length - 1), false]]

      until stack.empty?
        range, backtrack = stack.pop

        next if range.none?

        if backtrack
          hash[range] = TreeNode.new(
            hash[range][0],
            hash[hash[range][1]],
            hash[hash[range][2]]
          )

          next
        end

        i = range.begin
        j = i + 1

        while j <= range.end
          i = j if nums[i] < nums[j]
          j += 1
        end

        hash[range] = [nums[i], range.begin..(i - 1), (i + 1)..range.end]

        stack.push([range, true])
        stack.push([range.begin..(i - 1), false])
        stack.push([(i + 1)..range.end, false])
      end

      hash[0..(nums.length - 1)]
    end
  end
end
