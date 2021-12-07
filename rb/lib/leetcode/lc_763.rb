# frozen_string_literal: true

module LeetCode
  # 763. Partition Labels
  module LC763
    # Description:
    # A string S of lowercase letters is given.
    # We want to partition this string into as many parts as possible so that each letter appears in at most one part,
    # and return a list of integers representing the size of these parts.
    #
    # Examples:
    # Input: S = "ababcbacadefegdehijhklij"
    # Output: [9, 7, 8]
    # Explanation:
    # The partition is "ababcbaca", "defegde", "hijhklij".
    # This is a partition so that each letter appears in at most one part.
    # A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
    #
    # Notes:
    # - S will have length in range [1, 500].
    # - S will consist of lowercase letters ('a' to 'z') only.
    #
    # @param s {String}
    # @return {Array<Integer>}
    def partition_labels(s)
      remaining = s
      partitions = []

      until remaining.empty?
        up_to = pinpoint(remaining)
        remaining = remaining[up_to..]
        partitions.push(up_to)
      end

      partitions
    end

    def pinpoint(s)
      letter_set = [s[0]]
      cursor = s.length - 1

      loop {
        cursor -= 1 while cursor.positive? && !letter_set.include?(s[cursor])
        new_letter_set = s[0..cursor].chars.sort.uniq

        break if letter_set == new_letter_set

        cursor = s.length - 1
        letter_set = new_letter_set
      }

      cursor + 1
    end
  end
end
