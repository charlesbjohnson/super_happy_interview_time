# frozen_string_literal: true

module LeetCode
  # 278. First Bad Version
  module LC278
    # Description:
    # You are a product manager and currently leading a team to develop a new product.
    # Unfortunately, the latest version of your product fails the quality check.
    # Since each version is developed based on the previous version, all the versions after a bad version are also bad.
    #
    # Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
    #
    # You are given an API bool is_bad_version(version) which will return whether version is bad.
    # Implement a function to find the first bad version.
    #
    # You should minimize the number of calls to the API.
    #
    # Examples:
    # Input: n = 5, bad = 4
    # Output: 4
    #
    # Input: n = 1, bad = 1
    # Output: 1
    #
    # @param {Integer} n
    # @return {Integer}
    def first_bad_version(n)
      lo = 1
      hi = n

      while lo < hi
        mid = ((hi - lo) / 2) + lo
        bad = is_bad_version(mid)

        if !bad
          lo = mid + 1
        else
          hi = mid
        end
      end

      lo
    end
  end
end
