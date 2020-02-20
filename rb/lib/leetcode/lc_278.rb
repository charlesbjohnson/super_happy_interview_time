# typed: false
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
    # You should minimize the number of calls to the API.
    #
    # @param {Integer}
    # @return {Integer}
    def first_bad_version(versions)
      low = 1
      high = versions

      loop do
        return low if low == high

        if high - low == 1
          return is_bad_version(low) ? low : high
        end

        mid = ((high - low) / 2) + low

        if is_bad_version(mid)
          high = mid
        else
          low = mid + 1
        end
      end
    end
  end
end
