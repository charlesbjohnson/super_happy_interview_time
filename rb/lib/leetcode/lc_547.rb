# frozen_string_literal: true

module LeetCode
  # 547. Number of Provinces
  module LC547
    UnionFind = Helpers::LeetCode::UnionFind

    # Description:
    # There are n cities. Some of them are connected, while some are not.
    # If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
    #
    # A province is a group of directly or indirectly connected cities and no other cities outside of the group.
    #
    # You are given an n x n matrix is_connected where is_connected[i][j] = 1 if the ith city and the jth city are directly connected, and is_connected[i][j] = 0 otherwise.
    #
    # Return the total number of provinces.
    #
    # Examples:
    # Input: is_connected = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
    # Output: 2
    #
    # Input: is_connected = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
    # Output: 3
    #
    # @param {Array<Array<Integer>>} is_connected
    # @return {Integer}
    def find_circle_num(is_connected)
      result = is_connected.length

      uf = UnionFind.new(result)
      is_connected.each_with_index { |edges, i|
        edges.each_with_index { |connected, j|
          if connected == 1 && i != j
            result -= 1 if uf.union(i, j)
          end
        }
      }

      result
    end
  end
end
