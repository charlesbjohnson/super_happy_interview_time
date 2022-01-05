# frozen_string_literal: true

module LeetCode
  # 841. Keys and Rooms
  module LC841
    # Description:
    # There are n rooms labeled from 0 to n - 1 and all the rooms are locked except for room 0.
    # Your goal is to visit all the rooms. However, you cannot enter a locked room without having its key.
    #
    # When you visit a room, you may find a set of distinct keys in it.
    # Each key has a number on it, denoting which room it unlocks, and you can take all of them with you to unlock the other rooms.
    #
    # Given an array rooms where rooms[i] is the set of keys that you can obtain if you visited room i,
    # return true if you can visit all the rooms, or false otherwise.
    #
    # Examples:
    # Input: rooms = [[1], [2], [3], []]
    # Output: true
    #
    # Input: rooms = [[1, 3], [3, 0, 1], [2], [0]]
    # Output: false
    #
    # @param {Array<Array<Integer>>} rooms
    # @return {Boolean}
    def can_visit_all_rooms(rooms)
      visited = Array.new(rooms.length, false)
      stack = [0]

      until stack.empty?
        room = stack.pop

        visited[room] = true

        rooms[room].each { |next_room|
          stack.push(next_room) if !visited[next_room]
        }
      end

      visited.all?
    end
  end
end
