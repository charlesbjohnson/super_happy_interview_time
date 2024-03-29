# frozen_string_literal: true

require("config")
require("ctci/ctci_c3_p7")

module CTCI
  module C3
    class TestP7 < Minitest::Test
      def setup
        @animal_queue = P7.new
      end

      def test_dequeue_any
        2.times {
          @animal_queue.enqueue(Animal.dog)
          @animal_queue.enqueue(Animal.cat)
        }

        dequeued = @animal_queue.dequeue_any

        assert_predicate(dequeued, :dog?)
        assert_equal(1, dequeued.order)
      end

      def test_dequeue_any_when_only_dog
        @animal_queue.enqueue(Animal.dog)
        assert_predicate(@animal_queue.dequeue_any, :dog?)
      end

      def test_dequeue_any_when_only_cat
        @animal_queue.enqueue(Animal.cat)
        assert_predicate(@animal_queue.dequeue_any, :cat?)
      end

      def test_dequeue_any_when_empty
        assert_nil(@animal_queue.dequeue_any)
      end

      def test_dequeue_dog
        @animal_queue.enqueue(Animal.cat)
        5.times { @animal_queue.enqueue(Animal.dog) }

        dequeued = @animal_queue.dequeue_dog

        assert_predicate(dequeued, :dog?)
        assert_equal(2, dequeued.order)
      end

      def test_dequeue_dog_when_only_cat
        @animal_queue.enqueue(Animal.cat)
        assert_nil(@animal_queue.dequeue_dog)
      end

      def test_dequeue_cat
        @animal_queue.enqueue(Animal.dog)
        5.times { @animal_queue.enqueue(Animal.cat) }

        dequeued = @animal_queue.dequeue_cat

        assert_predicate(dequeued, :cat?)
        assert_equal(2, dequeued.order)
      end

      def test_dequeue_cat_when_only_dog
        @animal_queue.enqueue(Animal.dog)
        assert_nil(@animal_queue.dequeue_cat)
      end
    end
  end
end
