# frozen_string_literal: true

module LeetCode
  # 40. Combination Sum II
  module LC40
    # Description:
    # Given a collection of candidate numbers (candidates) and a target number (target),
    # find all unique combinations in candidates where the candidate numbers sum to target.
    #
    # Each number in candidates may only be used once in the combination.
    #
    # Note: The solution set must not contain duplicate combinations.
    #
    # Examples:
    # Input: candidates = [10, 1, 2, 7, 6, 1, 5], target = 8
    # Output: [
    #   [1, 1, 6],
    #   [1, 2, 5],
    #   [1, 7],
    #   [2, 6]
    # ]
    #
    # Input: candidates = [2, 5, 2, 1, 2], target = 5
    # Output: [
    #   [1, 2, 2],
    #   [5]
    # ]
    #
    # @param {Array<Integer>} candidates
    # @param {Integer} target
    # @return {Array<Array<Integer>>}
    def combination_sum2(candidates, target)
      result = private_methods.grep(/^combination_sum2_\d+$/).map { |m| send(m, candidates.clone, target).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def combination_sum2_1(candidates, target)
      candidates.sort!

      rec = ->(i, combination, sum) {
        return [combination] if sum == target

        return [] if i == candidates.length
        return [] if target - sum < candidates[i]

        j = i + 1
        j += 1 while j < candidates.length && candidates[j] == candidates[j - 1]

        rec.call(i + 1, combination + [candidates[i]], sum + candidates[i]) + rec.call(j, combination, sum)
      }

      rec.call(0, [], 0)
    end

    def combination_sum2_2(candidates, target)
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

        j = i + 1
        j += 1 while j < candidates.length && candidates[j] == candidates[j - 1]

        stack.push([j, combination, sum])
        stack.push([i + 1, combination + [candidates[i]], sum + candidates[i]])
      end

      result
    end

    def combination_sum2_3(candidates, target)
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
          if i == j || candidates[j] != candidates[j - 1]
            combination.push(candidates[j])
            sum += candidates[j]
            rec.call(j + 1)
            sum -= candidates[j]
            combination.pop
          end
        }
      }

      rec.call(0)
      result
    end
  end
end
