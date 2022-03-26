# frozen_string_literal: true

module LeetCode
  # 1335. Minimum Difficulty of a Job Schedule
  module LC1335
    # Description:
    # You want to schedule a list of jobs in d days. Jobs are dependent (i.e To work on the ith job, you have to finish all the jobs j where 0 <= j < i).
    #
    # You have to finish at least one task every day.
    # The difficulty of a job schedule is the sum of difficulties of each day of the d days.
    # The difficulty of a day is the maximum difficulty of a job done on that day.
    #
    # You are given an integer array job_difficulty and an integer d. The difficulty of the ith job is job_difficulty[i].
    #
    # Return the minimum difficulty of a job schedule. If you cannot find a schedule for the jobs return -1.
    #
    # Examples:
    # Input: job_difficulty = [6, 5, 4, 3, 2, 1], d = 2
    # Output: 7
    #
    # Input: job_difficulty = [9, 9, 9], d = 4
    # Output: -1
    #
    # Input: job_difficulty = [1, 1, 1], d = 3
    # Output: 3
    #
    # @param {Array<Integer>} job_difficulty
    # @param {Integer} d
    # @return {Integer}
    def min_difficulty(job_difficulty, d)
      result = private_methods.grep(/^min_difficulty_\d+$/).map { |m| send(m, job_difficulty, d) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def min_difficulty_1(jobs, days)
      return -1 if jobs.length < days

      cache = {}

      rec = ->(d, j) {
        return jobs[j..].max if d == days - 1

        jobs_remaining = jobs.length - j
        days_remaining = days - d - 1
        max_jobs_today = jobs_remaining - days_remaining

        cache[[d, j]] ||= (1..max_jobs_today).map { |i|
          jobs[j...(j + i)].max + rec.call(d + 1, j + i)
        }.min
      }

      rec.call(0, 0)
    end

    def min_difficulty_2(jobs, days)
      return -1 if jobs.length < days

      cache = Array.new(days + 1) { Array.new(jobs.length + 1, Float::INFINITY) }

      cache[days - 1][jobs.length - 1] = jobs[-1]
      (jobs.length - 2).downto(days - 1) { |j|
        cache[days - 1][j] = [jobs[j], cache[days - 1][j + 1]].max
      }

      (days - 2).downto(0) { |d|
        jobs_remaining = jobs.length - d
        days_remaining = days - d - 1
        last_job_today = jobs_remaining - days_remaining + d

        (d...last_job_today).each { |j|
          max_jobs_today = last_job_today - j

          cache[d][j] = (1..max_jobs_today).map { |i|
            jobs[j...(j + i)].max + cache[d + 1][j + i]
          }.min
        }
      }

      cache[0][0]
    end
  end
end
