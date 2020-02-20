# typed: true
# frozen_string_literal: true

module LeetCode
  # 406. Queue Reconstruction by Height
  module LC406
    # Description:
    # Suppose you have a random list of people standing in a queue.
    # Each person is described by a pair of integers (h, k), where h is the height of the person
    # and k is the number of people in front of this person who have a height greater than or equal to h.
    # Write an algorithm to reconstruct the queue.
    #
    # Examples:
    # Input: [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
    # Output: [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
    #
    # Notes:
    # - The number of people is less than 1,100.
    #
    # @param people {Array<Array<Integer>>}
    # @return {Array<Array<Integer>>}
    def reconstruct_queue(people)
      queue = []

      people.sort! do |(left_h, left_k), (right_h, right_k)|
        next 1 if left_h < right_h
        next -1 if left_h > right_h

        left_k <=> right_k
      end

      until people.empty?
        person = people.shift
        queue.insert(person[1], person)
      end

      queue
    end
  end
end
