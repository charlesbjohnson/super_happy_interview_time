# frozen_string_literal: true

module LeetCode
  # 657. Judge Route Circle
  module LC657
    Point = Struct.new(:x, :y)

    # Description:
    # Initially, there is a Robot at position (0, 0).
    # Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
    #
    # The move sequence is represented by a string. And each move is represent by a character.
    # The valid robot moves are R (Right), L (Left), U (Up) and D (down).
    # The output should be true or false representing whether the robot makes a circle.
    #
    # Examples:
    # - 1:
    #   Input: "UD"
    #   Output: true
    #
    # - 2:
    #   Input: "LL"
    #   Output: false
    #
    # @param moves {String}
    # @return {Boolean}
    def judge_circle(moves)
      origin = Point.new(0, 0)
      current = origin.clone

      moves.chars.each do |move|
        case move
        when 'R'
          current.x += 1
        when 'L'
          current.x -= 1
        when 'U'
          current.y += 1
        when 'D'
          current.y -= 1
        end
      end

      origin == current
    end
  end
end
