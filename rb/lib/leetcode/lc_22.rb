# frozen_string_literal: true

module LeetCode
  # 22. Generate Parentheses
  module LC22
    # Description:
    # Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
    #
    # Examples:
    #
    # Input: n = 3
    # Output: ["((()))", "(()())", "(())()", "()(())", "()()()"]
    #
    # Input: n = 1
    # Output: ["()"]
    #
    # @param {Integer} n
    # @return {Array<String>}
    def generate_parenthesis(n)
      result = private_methods.grep(/^generate_parenthesis_\d+$/).map { |m| send(m, n).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def generate_parenthesis_1(n)
      rec = ->(i, open, combination) {
        return [combination] if i == n && open == 0

        return [] if open < 0
        return [] if i + open > n

        rec.call(i, open + 1, combination + "(") + rec.call(i + 1, open - 1, combination + ")")
      }

      rec.call(0, 0, "")
    end

    def generate_parenthesis_2(n)
      result = []
      stack = [[0, 0, ""]]

      until stack.empty?
        i, open, combination = stack.pop

        if i == n && open == 0
          result.push(combination)
          next
        end

        next if open < 0
        next if i + open > n

        stack.push([i + 1, open - 1, combination + ")"])
        stack.push([i, open + 1, combination + "("])
      end

      result
    end

    def generate_parenthesis_3(n)
      result = []

      combination = []
      open = 0

      rec = ->(i) {
        if i == n && open == 0
          result.push(combination.join)
          return
        end

        return if open < 0
        return if i + open > n

        combination.push("(")
        open += 1
        rec.call(i)
        open -= 1
        combination.pop

        combination.push(")")
        open -= 1
        rec.call(i + 1)
        open += 1
        combination.pop
      }

      rec.call(0)
      result
    end
  end
end
