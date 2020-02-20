# typed: true
# frozen_string_literal: true

module LeetCode
  # 38. Count and Say
  module LC38
    def count_and_say_recurse(iteration, nth, chars)
      return chars if iteration == nth

      i = 0
      result = []

      while i < chars.length
        cursor = i + 1

        cursor += 1 while cursor < chars.length && chars[cursor] == chars[cursor - 1]

        result.push((cursor - i).to_s, chars[i])
        i = cursor
      end

      count_and_say_recurse(iteration + 1, nth, result)
    end

    # Description:
    # The count-and-say sequence is the sequence of integers with the first five terms as following:
    #
    # 1. 1
    # 2. 11
    # 3. 21
    # 4. 1211
    # 5. 111221
    #
    # 1 is read off as "one 1" or 11.
    # 11 is read off as "two 1s" or 21.
    # 21 is read off as "one 2, then one 1" or 1211.
    #
    # Given an integer n, generate the nth term of the count-and-say sequence.
    #
    # Examples:
    # - 1:
    #   Input: 1
    #   Output: "1"
    #
    # - 2:
    #   Input: 4
    #   Output: "1211"
    #
    # Notes:
    # - Each term of the sequence of integers will be represented as a string.
    #
    # @param nth {Integer}
    # @return {String}
    def count_and_say(nth)
      count_and_say_recurse(1, nth, ['1']).join
    end
  end
end
