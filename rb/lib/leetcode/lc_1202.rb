# frozen_string_literal: true

module LeetCode
  # 1202. Smallest String With Swaps
  module LC1202
    MinHeap = Helpers::LeetCode::MinHeap
    UnionFind = Helpers::LeetCode::UnionFind

    # Description:
    # You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string.
    # You can swap the characters at any pair of indices in the given pairs any number of times.
    #
    # Return the lexicographically smallest string that s can be changed to after using the swaps.
    #
    # Examples:
    # Input: s = "dcab", pairs = [[0, 3], [1, 2]]
    # Output: "bacd"
    #
    # Input: s = "dcab", pairs = [[0, 3], [1, 2], [0, 2]]
    # Output: "abcd"
    #
    # Input: s = "cba", pairs = [[0, 1], [1, 2]]
    # Output: "abc"
    #
    # @param {String} s
    # @param {Array<Array<(Integer, Integer)>>} pairs
    # @return {String}
    def smallest_string_with_swaps(s, pairs)
      result = +""

      uf = UnionFind.new(s.length)
      pairs.each { |i, j|
        uf.union(i, j)
      }

      groups = Hash.new { |h, k| h[k] = MinHeap.new }
      (0...s.length).each { |i|
        groups[uf.find(i)].push(s[i])
      }

      uf.each { |root| result += groups[root].pop }
      result
    end
  end
end
