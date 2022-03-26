# frozen_string_literal: true

module LeetCode
  # 48. Rotate Image
  module LC48
    # Description:
    # You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
    #
    # You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
    # DO NOT allocate another 2D matrix and do the rotation.
    #
    # Examples:
    # Input: matrix = [
    #  [1, 2, 3],
    #  [4, 5, 6],
    #  [7, 8, 9]
    # ]
    # Output: [
    #  [7, 4, 1],
    #  [8, 5, 2],
    #  [9, 6, 3]
    # ]
    #
    # Input: matrix = [
    #  [ 5,  1,  9, 11],
    #  [ 2,  4,  8, 10],
    #  [13,  3,  6,  7],
    #  [15, 14, 12, 16]
    # ]
    # Output: [
    #  [15, 13,  2,  5],
    #  [14,  3,  4,  1],
    #  [12,  6,  8,  9],
    #  [16,  7, 10, 11]
    # ]
    #
    # @param {Array<Array<Integer>>} matrix
    # @return {nil}
    def rotate(matrix)
      result = private_methods.grep(/^rotate_\d+$/).map { |m|
        Marshal.load(Marshal.dump(matrix)).tap { |mtx| send(m, mtx) }
      }.uniq

      result.length == 1 ? rotate_2(matrix) : raise
    end

    private

    def rotate_1(matrix)
      size = matrix.length
      offset = 0

      rotation = ->(r, c) {
        result = [-1, -1]

        if r == 0
          result[0] = c
          result[1] = size - 1
        elsif r == size - 1
          result[0] = c
          result[1] = 0
        elsif c == 0
          result[0] = 0
          result[1] = size - 1 - r
        elsif c == size - 1
          result[0] = size - 1
          result[1] = size - 1 - r
        end

        result
      }

      while size > 1
        (0...size - 1).each { |i|
          p1 = [0, i]
          p2 = rotation.call(*p1)
          p3 = rotation.call(*p2)
          p4 = rotation.call(*p3)

          p1_v = matrix[p1[0] + offset][p1[1] + offset]
          p2_v = matrix[p2[0] + offset][p2[1] + offset]
          p3_v = matrix[p3[0] + offset][p3[1] + offset]
          p4_v = matrix[p4[0] + offset][p4[1] + offset]

          matrix[p1[0] + offset][p1[1] + offset] = p4_v
          matrix[p2[0] + offset][p2[1] + offset] = p1_v
          matrix[p3[0] + offset][p3[1] + offset] = p2_v
          matrix[p4[0] + offset][p4[1] + offset] = p3_v
        }

        size -= 2
        offset += 1
      end

      nil
    end

    def rotate_2(matrix)
      size = matrix.length

      (0...size).each { |r|
        (r...size).each { |c|
          matrix[r][c], matrix[c][r] = matrix[c][r], matrix[r][c]
        }
      }

      (0...size).each { |r|
        (0...(size / 2)).each { |c|
          matrix[r][c], matrix[r][-(c + 1)] = matrix[r][-(c + 1)], matrix[r][c]
        }
      }

      nil
    end
  end
end
