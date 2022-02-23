# frozen_string_literal: true

module LeetCode
  # 332. Reconstruct Itinerary
  module LC332
    TreeMap = Helpers::LeetCode::TreeMap

    # Description:
    # You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight.
    # Reconstruct the itinerary in order and return it.
    #
    # All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK".
    # If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.
    #
    # For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
    # You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.
    #
    # Examples:
    # Input: tickets = [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
    # Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]
    #
    # Input: tickets = [["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]]
    # Output: ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"]
    #
    # @param {Array<Array<(String, String)>>} tickets
    # @return {Array<String>}
    def find_itinerary(tickets)
      graph = Hash.new { |h, k| h[k] = TreeMap.new(0) }
      tickets.each { |from, to|
        graph[from][to] += 1
      }

      stack = [[nil, "JFK", [], false]]

      until stack.empty?
        from, to, path, visited = stack.pop

        return path + [to] if path.length == tickets.length

        if visited || graph[to].empty?
          graph[from][to] += 1
        else
          graph[from][to] -= 1

          stack.push([from, to, path, true])
          graph[to].reverse_each { |neighbor, count|
            stack.push([to, neighbor, path + [to], false]) if count > 0
          }
        end
      end
    end
  end
end
