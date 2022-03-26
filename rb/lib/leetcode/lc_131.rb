# frozen_string_literal: true

module LeetCode
  # 131. Palindrome Partitioning
  module LC131
    # Description:
    # Given a string s, partition s such that every substring of the partition is a palindrome.
    # Return all possible palindrome partitioning of s.
    #
    # A palindrome string is a string that reads the same backward as forward.
    #
    # Examples:
    # Input: s = "aab"
    # Output: [["a", "a", "b"], ["aa", "b"]]
    #
    # Input: s = "a"
    # Output: [["a"]]
    #
    # @param {String} s
    # @return {Array<Array<String>>}
    def partition(s)
      result = private_methods.grep(/^partition_\d+$/).map { |m| send(m, s).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def partition_1(s)
      is_palindrome = is_palindrome_strategy(s)

      rec = ->(i, partition) {
        return [partition] if i == s.length

        (i...s.length).flat_map { |j|
          is_palindrome.call(i, j) ? rec.call(j + 1, partition + [s[i..j]]) : []
        }
      }

      rec.call(0, [])
    end

    def partition_2(s)
      is_palindrome = is_palindrome_strategy(s)

      result = []
      stack = [[0, []]]

      until stack.empty?
        i, partition = stack.pop

        if i == s.length
          result.push(partition)
          next
        end

        (i...s.length).reverse_each { |j|
          stack.push([j + 1, partition + [s[i..j]]]) if is_palindrome.call(i, j)
        }
      end

      result
    end

    def partition_3(s)
      is_palindrome = is_palindrome_strategy(s)

      result = []
      partition = []

      rec = ->(i) {
        if i == s.length
          result.push(partition.clone)
          return
        end

        (i...s.length).each { |j|
          if is_palindrome.call(i, j)
            partition.push(s[i..j])
            rec.call(j + 1)
            partition.pop
          end
        }
      }

      rec.call(0)
      result
    end

    def is_palindrome_strategy(s)
      is_palindrome_strategy_3(s)
    end

    def is_palindrome_strategy_1(s)
      ->(i, j) {
        while i < j
          return false if s[i] != s[j]
          i += 1
          j -= 1
        end

        true
      }
    end

    def is_palindrome_strategy_2(s)
      cache = Array.new(s.length) { |i| Array.new(s.length) { |j| i == j } }
      (2..s.length).each { |size|
        (0..(s.length - size)).each { |i|
          j = i + size - 1
          cache[i][j] = s[i] == s[j] && (size == 2 || is_palindrome[i + 1][j - 1])
        }
      }

      ->(i, j) { cache[i][j] }
    end

    def is_palindrome_strategy_3(s)
      cache = Array.new(s.length) { Array.new(s.length) }
      (0...s.length).each { |i|
        l, r = i, i
        while l >= 0 && r < s.length && s[l] == s[r]
          cache[l][r] = true
          l -= 1
          r += 1
        end

        l, r = i, i + 1
        while l >= 0 && r < s.length && s[l] == s[r]
          cache[l][r] = true
          l -= 1
          r += 1
        end
      }

      ->(i, j) { cache[i][j] }
    end
  end
end
