# frozen_string_literal: true

module LeetCode
  # 743. Network Delay Time
  module LC743
    Heap = Helpers::LeetCode::Heap

    # Description:
    # You are given a network of n nodes, labeled from 1 to n.
    # You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target.
    #
    # We will send a signal from a given node k. Return the time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.
    #
    # Examples:
    # Input: times = [[2, 1, 1], [2, 3, 1], [3, 4, 1]], n = 4, k = 2
    # Output: 2
    #
    # Input: times = [[1, 2, 1]], n = 2, k = 1
    # Output: 1
    #
    # Input: times = [[1, 2, 1]], n = 2, k = 2
    # Output: -1
    #
    # @param {Array<Array<(Integer, Integer, Integer)>>} times
    # @param {Integer} n
    # @param {Integer} k
    # @return {Integer}
    def network_delay_time(times, n, k)
      graph = times.each_with_object(Array.new(n) { [] }) { |(u, v, w), g| g[u - 1].push([v - 1, w]) }
      visited = Array.new(n, false)

      latencies = Array.new(n) { |i| i == k - 1 ? 0 : Float::INFINITY }
      heap = Heap.new([[k - 1, latencies[k - 1]]]) { |a, b| b[1] <=> a[1] }

      until heap.empty?
        node, latency = heap.pop

        next if visited[node]
        visited[node] = true

        graph[node].each { |neighbor, neighbor_delay|
          neighbor_latency = latency + neighbor_delay

          if neighbor_latency < latencies[neighbor]
            latencies[neighbor] = neighbor_latency
            heap.push([neighbor, neighbor_latency])
          end
        }
      end

      max = latencies.max
      max.infinite? ? -1 : max
    end
  end
end
