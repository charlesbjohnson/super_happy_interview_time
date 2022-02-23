# frozen_string_literal: true

module LeetCode
  # 1101. The Earliest Moment When Everyone Become Friends
  module LC1101
    UnionFind = Helpers::LeetCode::UnionFind

    # Description:
    # There are n people in a social group labeled from 0 to n - 1.
    # You are given an array logs where logs[i] = [timestampi, xi, yi] indicates that xi and yi will be friends at the time timestampi.
    #
    # Friendship is symmetric. That means if a is friends with b, then b is friends with a.
    # Also, person a is acquainted with a person b if a is friends with b, or a is a friend of someone acquainted with b.
    #
    # Return the earliest time for which every person became acquainted with every other person.
    # If there is no such earliest time, return -1.
    #
    # Examples:
    # Input: logs = [[20190101, 0, 1], [20190104, 3, 4], [20190107, 2, 3], [20190211, 1, 5], [20190224, 2, 4], [20190301, 0, 3], [20190312, 1, 2], [20190322, 4, 5]], n = 6
    # Output: 20190301
    #
    # Input: logs = [[0, 2, 0], [1, 0, 1], [3, 0, 3], [4, 1, 2], [7, 3, 1]], n = 4
    # Output: 3
    #
    # @param {Array<Array(Integer, Integer, Integer)>} logs
    # @param {Integer} n
    # @return {Integer}
    def earliest_acq(logs, n)
      logs.sort_by! { |ts, _, _| ts }

      uf = UnionFind.new(n)
      count = n

      logs.each { |ts, a, b|
        count -= 1 if uf.union(a, b)
        return ts if count == 1
      }

      -1
    end
  end
end
