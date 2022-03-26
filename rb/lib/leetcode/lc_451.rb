# frozen_string_literal: true

module LeetCode
  # 451. Sort Characters By Frequency
  module LC451
    # Description:
    # Given a string s, sort it in decreasing order based on the frequency of the characters.
    # The frequency of a character is the number of times it appears in the string.
    #
    # Examples:
    # Return the sorted string. If there are multiple answers, return any of them.
    #
    # Input: s = "tree"
    # Output: "eert"
    #
    # Input: s = "cccaaa"
    # Output: "aaaccc"
    #
    # Input: s = "Aabb"
    # Output: "bbAa"
    #
    # @param {String} s
    # @return {String}
    def frequency_sort(s)
      result = private_methods.grep(/^frequency_sort_\d+$/).map { |m| send(m, s) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def frequency_sort_1(s)
      hash = s.each_char.tally
      hash.each_key.sort { |a, b| hash[b] <=> hash[a] }.flat_map { |c| c * hash[c] }.join
    end

    def frequency_sort_2(s)
      result = +""

      hash = s.each_char.tally
      buckets = Array.new(s.length + 1) { [] }
      hash.each { |c, frequency| buckets[frequency].push(c) }

      buckets.reverse_each { |bucket|
        bucket.each { |c|
          hash[c].times { result << c }
        }
      }

      result
    end
  end
end
