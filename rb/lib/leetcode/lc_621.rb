# typed: true
# frozen_string_literal: true

module LeetCode
  # 621. Task Scheduler
  module LC621
    # Description:
    # Given a char array representing tasks CPU need to do.
    # It contains capital letters A to Z where different letters represent different tasks.
    # Tasks could be done without original order.
    # Each task could be done in one interval.
    # For each interval, CPU could finish one task or just be idle.
    #
    # However, there is a non-negative cooling interval n that means between two same tasks,
    # there must be at least n intervals that CPU are doing different tasks or just be idle.
    #
    # You need to return the least number of intervals the CPU will take to finish all the given tasks.
    #
    # Examples:
    # Input: tasks = ["A", "A", "A", "B", "B", "B"], n = 2
    # Output: 8
    # Explanation: A->B->idle->A->B->idle->A->B.
    #
    # Notes:
    # - The number of tasks is in the range [1, 10000].
    # - The integer n is in the range [0, 100].
    #
    # @param tasks {Array<String>}
    # @param n {Integer}
    # @return {Integer}
    def least_interval(tasks, n)
      return tasks.length if n <= 0

      intervals = 0
      tasks = tasks.group_by(&:itself).transform_values(&:length).values.sort

      while !tasks.empty? && tasks[tasks.length - 1].positive?
        cooldown = 0

        while cooldown <= n
          break if tasks[tasks.length - 1].zero?

          tasks[(tasks.length - 1) - cooldown] -= 1 if cooldown < tasks.length && tasks[(tasks.length - 1) - cooldown].positive?

          intervals += 1
          cooldown += 1
        end

        tasks = tasks.select(&:positive?).sort
      end

      intervals
    end
  end
end
