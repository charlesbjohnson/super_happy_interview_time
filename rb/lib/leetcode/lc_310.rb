# frozen_string_literal: true

module LeetCode
  # 310. Minimum Height Trees
  module LC310
    # Description:
    # A tree is an undirected graph in which any two vertices are connected by exactly one path.
    # In other words, any connected graph without simple cycles is a tree.
    #
    # Given a tree of n nodes labelled from 0 to n - 1, and an array of n - 1 edges where edges[i] = [ai, bi] indicates that there is an undirected edge between the two nodes ai and bi in the tree,
    # you can choose any node of the tree as the root.
    #
    # When you select a node x as the root, the result tree has height h.
    # Among all possible rooted trees, those with minimum height (i.e. min(h))  are called minimum height trees (MHTs).
    #
    # Return a list of all MHTs' root labels. You can return the answer in any order.
    #
    # The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.
    #
    # Examples:
    # Input: n = 4, edges = [[1, 0], [1, 2], [1, 3]]
    # Output: [1]
    #
    # Input: n = 6, edges = [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]]
    # Output: [3, 4]
    #
    # @param {Integer} n
    # @param {Array<Array<(Integer, Integer)>>} edges
    # @return {Array<Integer>}
    def find_min_height_trees(n, edges)
      graph = {}

      (0...n).each { |node|
        graph[node] = Set.new
      }

      edges.each { |a, b|
        graph[a].add(b)
        graph[b].add(a)
      }

      nodes = []
      graph.each { |node, edges|
        nodes.push(node) if edges.size == 1
      }

      while graph.size > 2
        p_nodes, nodes = nodes, []

        p_nodes.each { |node|
          graph[node].each { |neighbor|
            graph[neighbor].delete(node)
            nodes.push(neighbor) if graph[neighbor].size == 1
          }

          graph.delete(node)
        }
      end

      graph.keys
    end
  end
end
