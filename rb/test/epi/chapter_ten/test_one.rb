# frozen_string_literal: true

require 'config'

module EPI
  module ChapterTen
    class TestOne < Minitest::Test
      BinarySearchTreeMap = DataStructures::BinarySearchTreeMap.dup.class_exec do
        include One
      end

      def test_balanced_is_implemented
        assert_respond_to(BinarySearchTreeMap.new, :balanced?)
      end
    end
  end
end
