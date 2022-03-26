# frozen_string_literal: true

module LeetCode
  # 621. Task Scheduler
  module LC621
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task.
    # Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.
    #
    # However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array),
    # that is that there must be at least n units of time between any two same tasks.
    #
    # Return the least number of units of times that the CPU will take to finish all the given tasks.
    #
    # Examples:
    # Input: tasks = ["A", "A", "A", "B", "B", "B"], n = 2
    # Output: 8
    #
    # Input: tasks = ["A", "A", "A", "B", "B", "B"], n = 0
    # Output: 6
    #
    # Input: tasks = ["A", "A", "A", "A", "A", "A", "B", "C", "D", "E", "F", "G"], n = 2
    # Output: 16
    #
    # @param {Array<String>} tasks
    # @param {Integer} n
    # @return {Integer}
    def least_interval(tasks, n)
      result = 0
      count = tasks.tally

      work = Heap.new(count.keys) { |a, b| count[b] <=> count[a] }
      wait = []

      while !work.empty? || !wait.empty?
        while !wait.empty? && (result - wait[0][1]) - 1 >= n
          task, _ = wait.shift
          work.push(task)
        end

        if !work.empty?
          task = work.pop
          count[task] -= 1
          wait.push([task, result]) if count[task] > 0
        end

        result += 1
      end

      result
    end
  end
end
