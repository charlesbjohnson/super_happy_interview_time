# frozen_string_literal: true

module LeetCode
  # 658. Find K Closest Elements
  module LC658
    # Description:
    # Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array.
    # The result should also be sorted in ascending order.
    #
    # An integer a is closer to x than an integer b if:
    # - |a - x| < |b - x|, or
    # - |a - x| == |b - x| and a < b
    #
    # Examples:
    # Input: arr = [1, 2, 3, 4, 5], k = 4, x = 3
    # Output: [1, 2, 3, 4]
    #
    # Input: arr = [1, 2, 3, 4, 5], k = 4, x = -1
    # Output: [1, 2, 3, 4]
    #
    # @param {Array<Integer>} arr
    # @param {Integer} k
    # @param {Integer} x
    # @return {Array<Integer>}
    def find_closest_elements(arr, k, x)
      result = private_methods.grep(/^find_closest_elements_\d+$/).map { |m| send(m, arr.clone, k, x) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_closest_elements_1(arr, k, x)
      arr.sort_by! { |v| (v - x).abs }
      arr[...k].sort
    end

    def find_closest_elements_2(arr, k, x)
      lo = 0
      hi = arr.length - 1

      i = nil

      while lo + 1 < hi
        mid = ((hi - lo) / 2) + lo

        case x <=> arr[mid]
        when 0
          i = mid
          break
        when -1
          hi = mid
        when 1
          lo = mid
        end
      end

      if !i
        case (arr[lo] - x).abs <=> (arr[hi] - x).abs
        when -1, 0
          i = lo
        when 1
          i = hi
        end
      end

      l = i
      r = i

      while r - l < k - 1
        if l - 1 >= 0 && r + 1 < arr.length
          case (arr[l - 1] - x).abs <=> (arr[r + 1] - x)
          when -1, 0
            l -= 1
          when 1
            r += 1
          end
        elsif l - 1 >= 0
          l -= 1
        elsif r + 1 < arr.length
          r += 1
        end
      end

      arr[l..r]
    end

    def find_closest_elements_3(arr, k, x)
      lo = 0
      hi = arr.length - k

      while lo < hi
        mid = ((hi - lo) / 2) + lo

        if arr[mid] == arr[mid + k]
          if arr[mid] > x
            hi = mid
          else
            lo = mid + 1
          end
        elsif (x - arr[mid]).abs <= (x - arr[mid + k]).abs
          hi = mid
        else
          lo = mid + 1
        end
      end

      arr[lo...(lo + k)]
    end
  end
end
