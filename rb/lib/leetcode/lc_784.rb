# frozen_string_literal: true

module LeetCode
  # 784. Letter Case Permutation
  module LC784
    # Description:
    # Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.
    #
    # Return a list of all possible strings we could create. Return the output in any order.
    #
    # Examples:
    # Input: s = "a1b2"
    # Output: ["a1b2", "a1B2", "A1b2", "A1B2"]
    #
    # Input: s = "3z4"
    # Output: ["3z4", "3Z4"]
    #
    # @param {String} s
    # @return {Array<String>}
    def letter_case_permutation(s)
      result = private_methods.grep(/^letter_case_permutation_\d+$/).map { |m| send(m, s).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def letter_case_permutation_1(s)
      rec = ->(i, p) {
        return [p] if i == s.length

        if /\d/.match?(s[i])
          rec.call(i + 1, p + s[i])
        else
          rec.call(i + 1, p + s[i].downcase) + rec.call(i + 1, p + s[i].upcase)
        end
      }

      rec.call(0, "")
    end

    def letter_case_permutation_2(s)
      result = []
      stack = [[0, ""]]

      until stack.empty?
        i, p = stack.pop

        if i == s.length
          result.push(p)
          next
        end

        if /\d/.match?(s[i])
          stack.push([i + 1, p + s[i]])
        else
          stack.push([i + 1, p + s[i].downcase])
          stack.push([i + 1, p + s[i].upcase])
        end
      end

      result
    end
  end
end
