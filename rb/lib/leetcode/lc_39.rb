# frozen_string_literal: true

module LeetCode
  # 39. Combination Sum
  module LC39
    # Description:
    # Given an array of distinct integers candidates and a target integer target,
    # return a list of all unique combinations of candidates where the chosen numbers sum to target.
    #
    # You may return the combinations in any order.
    #
    # The same number may be chosen from candidates an unlimited number of times.
    # Two combinations are unique if the frequency of at least one of the chosen numbers is different.
    #
    # It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
    #
    # Examples:
    # Input: candidates = [2, 3, 6, 7], target = 7
    # Output: [[2, 2, 3], [7]]
    #
    # Input: candidates = [2, 3, 5], target = 8
    # Output: [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
    #
    # Input: candidates = [2], target = 1
    # Output: []
    #
    # @param {Array<Integer>} candidates
    # @param {Integer} target
    # @return {Array<Array<Integer>>}
    def combination_sum(candidates, target)
      result = private_methods.grep(/^combination_sum_\d+$/).map { |m| send(m, candidates.clone, target).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def combination_sum_1(candidates, target)
      candidates.sort!

      rec = ->(i, combination, sum) {
        return [combination] if sum == target

        return [] if i == candidates.length
        return [] if target - sum < candidates[i]

        rec.call(i, combination + [candidates[i]], sum + candidates[i]) + rec.call(i + 1, combination, sum)
      }

      rec.call(0, [], 0)
    end

    def combination_sum_2(candidates, target)
      candidates.sort!

      result = []
      stack = [[0, [], 0]]

      until stack.empty?
        i, combination, sum = stack.pop

        if sum == target
          result.push(combination)
          next
        end

        next if i == candidates.length
        next if target - sum < candidates[i]

        stack.push([i + 1, combination, sum])
        stack.push([i, combination + [candidates[i]], sum + candidates[i]])
      end

      result
    end

    def combination_sum_3(candidates, target)
      candidates.sort!

      result = []

      combination = []
      sum = 0

      rec = ->(i) {
        if sum == target
          result.push(combination.clone)
          return
        end

        return if i == candidates.length
        return if target - sum < candidates[i]

        combination.push(candidates[i])
        sum += candidates[i]
        rec.call(i)
        sum -= candidates[i]
        combination.pop

        rec.call(i + 1)
      }

      rec.call(0)
      result
    end

    def combination_sum_4(candidates, target)
      candidates.sort!

      result = []

      combination = []
      sum = 0

      rec = ->(i) {
        if sum == target
          result.push(combination.clone)
          return
        end

        return if i == candidates.length
        return if target - sum < candidates[i]

        (i...candidates.length).each { |j|
          combination.push(candidates[j])
          sum += candidates[j]
          rec.call(j)
          sum -= candidates[j]
          combination.pop
        }
      }

      rec.call(0)
      result
    end
  end
end
