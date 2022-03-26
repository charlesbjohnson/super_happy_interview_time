# frozen_string_literal: true

module LeetCode
  # 767. Reorganize String
  module LC767
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.
    #
    # Return any possible rearrangement of s or return "" if not possible.
    #
    # Examples:
    # Input: s = "aab"
    # Output: "aba"
    #
    # Input: s = "aaab"
    # Output: ""
    #
    # @param {String} s
    # @return {String}
    def reorganize_string(s)
      result = +""

      hash = s.each_char.tally
      heap = Heap.new(hash.keys) { |a, b| hash[b] <=> hash[a] }
      queue = nil

      while !heap.empty? || queue
        return "" if heap.empty?

        c = heap.pop
        result << c

        hash[c] -= 1
        heap.push(queue) if queue
        queue = hash[c] > 0 ? c : nil
      end

      result
    end
  end
end
