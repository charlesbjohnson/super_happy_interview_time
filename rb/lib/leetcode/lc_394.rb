# typed: false
# frozen_string_literal: true

module LeetCode
  # 394. Decode String
  module LC394
    def decode_string_recurse(times, chars)
      encoded_times = 1
      open_brackets = 0

      decoded_buffer = []
      encoded_buffer = []
      encoded_times_buffer = []

      chars.each { |char|
        if ("0".."9").cover?(char) && open_brackets.zero?
          encoded_times_buffer.push(char)

          unless encoded_buffer.empty?
            decoded_buffer.push(decode_string_recurse(1, encoded_buffer))
            encoded_buffer = []
          end

          next
        end

        if char == "["
          if open_brackets.zero?
            encoded_times = encoded_times_buffer.join.to_i
            encoded_times_buffer = []
          else
            encoded_buffer.push(char)
          end

          open_brackets += 1
          next
        end

        if char == "]"
          if open_brackets == 1
            decoded_buffer.push(decode_string_recurse(encoded_times, encoded_buffer))
            encoded_buffer = []
          else
            encoded_buffer.push(char)
          end

          open_brackets -= 1
          next
        end

        encoded_buffer.push(char)
      }

      (decoded_buffer.join + encoded_buffer.join) * times
    end

    # Description:
    # Given an encoded string, return its decoded string.
    # The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times.
    #
    # Examples:
    # - 1:
    #   Input: "3[a]2[bc]"
    #   Output: "aaabcbc"
    #
    # - 2:
    #   Input: "3[a2[c]]"
    #   Output: "accaccacc"
    #
    # - 3:
    #   Input: "2[abc]3[cd]ef"
    #   Output: "abcabccdcdcdef"
    #
    # Notes:
    # - k is guaranteed to be a positive integer.
    # - The input string is always valid; No extra white spaces, square brackets are well-formed, etc.
    # - The original data does not contain any digits and the digits are only for those repeat numbers, k.
    #
    # @param str {String}
    # @return {String}
    def decode_string(str)
      decode_string_recurse(1, str.chars)
    end
  end
end
