# typed: false
# frozen_string_literal: true

require "config"
require "data_structures/binary_heap_indexed_priority_queue"

describe DataStructures::BinaryHeapIndexedPriorityQueue do
  subject { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

  let(:priority) { ->(a, b) { a >= b } }

  it { _(subject).must_be_kind_of(Enumerable) }

  it { _(subject).must_respond_to :size }
  it { _(subject).must_respond_to :each }
  it { _(subject).must_respond_to :insert }
  it { _(subject).must_respond_to :include_index? }
  it { _(subject).must_respond_to :include_element? }
  it { _(subject).must_respond_to :empty? }
  it { _(subject).must_respond_to :element_at }
  it { _(subject).must_respond_to :peek_index }
  it { _(subject).must_respond_to :peek_element }
  it { _(subject).must_respond_to :pop }
  it { _(subject).must_respond_to :change_element_at }
  it { _(subject).must_respond_to :delete_element_at }

  describe "#size" do
    it "starts out empty" do
      _(subject.size).must_equal(0)
    end

    it "is increased on an #insert" do
      subject.insert(0, 1)
      _(subject.size).must_equal(1)
    end

    it "stays the same on a #peek_index" do
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.peek_index
      _(subject.size).must_equal(1)
    end

    it "stays the same on a #peek_element" do
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.peek_element
      _(subject.size).must_equal(1)
    end

    it "is decreased on a #pop" do
      subject.insert(0, 1)
      subject.pop
      _(subject.size).must_equal(0)
    end

    it "stays the same on a #change_element_at" do
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.change_element_at(0, 2)
      _(subject.size).must_equal(1)
    end

    it "is decreased on a #delete_element_at" do
      subject.insert(0, 1)
      subject.delete_element_at(0)
      _(subject.size).must_equal(0)
    end

    it "stays the same on #each" do
      [1, 2, 3, 4].each { |i| subject.insert(i, i) }
      subject.each {}
      _(subject.size).must_equal(4)
    end
  end

  describe "#insert" do
    it "inserts a element at an index" do
      subject.insert(3, 5)
      _(subject.include_index?(3)).must_equal(true)
      _(subject.include_element?(5)).must_equal(true)
    end

    describe "invalid index" do
      describe "when index is negative" do
        it "does nothing" do
          subject.insert(-3, 5)
          _(subject.include_index?(-3)).must_equal(false)
          _(subject.include_element?(5)).must_equal(false)
        end
      end

      describe "when index is already bound to an element" do
        before { subject.insert(3, 0) }

        it "does nothing" do
          subject.insert(3, 5)
          _(subject.include_index?(3)).must_equal(true)
          _(subject.include_element?(5)).must_equal(false)
          _(subject.include_element?(0)).must_equal(true)
        end
      end
    end

    describe "when it already contains elements" do
      before do
        [
          [1, 6],
          [6, 0],
          [9, -3],
          [0, 2],
          [2, 9],
          [3, 4]
        ].each { |i, e| subject.insert(i, e) }
      end

      it "inserts according to the priority" do
        _(subject.peek_element).must_equal(9)
        _(subject.peek_index).must_equal(2)
      end
    end

    describe "with a comparable priority" do
      let(:priority) { ->(a, b) { a <=> b } }

      before do
        [
          [1, 3],
          [3, 1],
          [8, -9],
          [0, 7],
          [2, 5]
        ].each { |i, e| subject.insert(i, e) }
      end

      it "prioritizes the positive comparison" do
        _(subject.peek_element).must_equal(7)
        _(subject.peek_index).must_equal(0)
      end
    end
  end

  describe "#include_index?" do
    describe "when there is a key for the index" do
      before { subject.insert(3, 5) }

      it "returns true" do
        _(subject.include_index?(3)).must_equal(true)
      end
    end

    describe "when there is not a key for the index" do
      it "returns false" do
        _(subject.include_index?(3)).must_equal(false)
      end
    end
  end

  describe "#include_element?" do
    describe "when the element exists in the priority queue" do
      before { subject.insert(3, 5) }

      it "returns true" do
        _(subject.include_element?(5)).must_equal(true)
      end
    end

    describe "when the element does not exist in the priority queue" do
      it "returns false" do
        _(subject.include_element?(5)).must_equal(false)
      end
    end
  end

  describe "#empty?" do
    describe "when the priority queue is empty" do
      it "returns true" do
        _(subject).must_be(:empty?)
      end
    end

    describe "when the priority queue is not empty" do
      before { subject.insert(3, 5) }

      it "returns false" do
        _(subject).wont_be(:empty?)
      end
    end
  end

  describe "#element_at" do
    describe "when the index exists in the priority queue" do
      before { subject.insert(3, 5) }

      it "returns the element for the given index" do
        _(subject.element_at(3)).must_equal(5)
      end
    end

    describe "when the index does not exist in the priority queue" do
      it "returns nil" do
        _(subject.element_at(3)).must_be_nil
      end
    end
  end

  describe "#peek_index" do
    before do
      [
        [1, 3],
        [3, 5],
        [8, 1]
      ].each { |i, e| subject.insert(i, e) }
    end

    it "returns the index for the highest priority key" do
      _(subject.peek_index).must_equal(3)
    end

    it "does not remove the index from the priority queue" do
      _(subject.peek_index).must_equal(3)
      _(subject.peek_index).must_equal(3)
    end

    it "does not remove the element for that index from the priority queue" do
      _(subject.peek_index).must_equal(3)
      _(subject.peek_element).must_equal(5)
      _(subject.element_at(subject.peek_index)).must_equal(5)
    end

    describe "when empty" do
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it "returns nil" do
        _(empty.peek_index).must_be_nil
      end
    end
  end

  describe "#peek_element" do
    before do
      [
        [3, 5],
        [0, 7],
        [6, 2]
      ].each { |i, e| subject.insert(i, e) }
    end

    it "returns the element with the highest priority" do
      _(subject.peek_element).must_equal(7)
    end

    it "does not remove the element from the priority queue" do
      _(subject.peek_element).must_equal(7)
      _(subject.peek_element).must_equal(7)
    end

    it "does not remove the index for that element from the priority queue" do
      _(subject.peek_element).must_equal(7)
      _(subject.peek_index).must_equal(0)
    end

    describe "when empty" do
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it "returns nil" do
        _(empty.peek_element).must_be_nil
      end
    end
  end

  describe "#pop" do
    before do
      [
        [4, 6],
        [2, 0],
        [7, 1],
        [3, 7],
        [5, 3]
      ].each { |i, e| subject.insert(i, e) }
    end

    it "returns the element with the highest priority" do
      _(subject.pop).must_equal(7)
    end

    it "removes the element from the priority queue" do
      subject.pop
      _(subject.pop).wont_equal(7)
    end

    it "removes the index for the element that was popped" do
      subject.pop
      _(subject.include_index?(3)).must_equal(false)
    end

    it "resolves the next highest priority element for each invocation" do
      _(subject.pop).must_equal(7)
      _(subject.pop).must_equal(6)
      _(subject.pop).must_equal(3)
    end

    describe "when empty" do
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it "returns nil" do
        _(empty.pop).must_be_nil
      end
    end
  end

  describe "#change_element_at" do
    describe "when the index exists in the priority queue" do
      before do
        [
          [4, 6],
          [2, 0],
          [5, 3],
          [1, 4],
          [7, 8],
          [9, 2]
        ].each { |i, e| subject.insert(i, e) }
      end

      it "changes the element for the given index" do
        subject.change_element_at(2, 10)
        _(subject.element_at(2)).must_equal(10)
      end

      describe "when increasing the priority at the index" do
        it "maintains priority" do
          subject.change_element_at(2, 10)
          _(subject.peek_element).must_equal(10)
        end
      end

      describe "when decreasing the priority at the index" do
        it "maintains priority" do
          subject.change_element_at(7, 1)
          _(subject.peek_element).must_equal(6)
        end
      end

      describe "with multiple operations" do
        before do
          subject.insert(6, 9)
          subject.pop
          subject.delete_element_at(1)
          subject.change_element_at(9, 7)
        end

        it "maintains priority" do
          _(subject.pop).must_equal(8)
          _(subject.pop).must_equal(7)
          _(subject.pop).must_equal(6)
          _(subject.pop).must_equal(3)
          _(subject.pop).must_equal(0)
          _(subject.pop).must_be_nil
        end
      end
    end

    describe "when the index does not exist in the priority queue" do
      it "does nothing" do
        subject.change_element_at(0, 9)
        _(subject.element_at(0)).must_be_nil
      end
    end
  end

  describe "#delete_element_at" do
    before do
      [
        [4, 6],
        [2, 0],
        [5, 3],
        [9, 8],
        [3, 1],
        [7, 4],
        [8, 2]
      ].each { |i, e| subject.insert(i, e) }
    end

    it "deletes the element at the given index" do
      subject.delete_element_at(4)
      _(subject.element_at(4)).must_be_nil
    end

    it "deletes the index" do
      subject.delete_element_at(4)
      _(subject.include_index?(4)).must_equal(false)
    end

    it "maintains priority" do
      subject.delete_element_at(4)
      _(subject.peek_element).must_equal(8)
    end

    describe "with multiple operationss" do
      before do
        subject.delete_element_at(4)
        subject.insert(1, 7)
        subject.pop
      end

      it "maintains priority" do
        _(subject.pop).must_equal(7)
        _(subject.pop).must_equal(4)
        _(subject.pop).must_equal(3)
        _(subject.pop).must_equal(2)
        _(subject.pop).must_equal(1)
        _(subject.pop).must_equal(0)
        _(subject.pop).must_be_nil
      end
    end

    describe "when the index does not exist in the priority queue" do
      it "does nothing" do
        subject.delete_element_at(0)
        _(subject.element_at(0)).must_be_nil
      end
    end
  end

  describe "#each" do
    before do
      [
        [1, 6],
        [6, 0],
        [9, -3],
        [0, 2],
        [2, 9],
        [3, 4]
      ].each { |i, e| subject.insert(i, e) }
    end

    it "yields each index and element by the highest priority" do
      expected = [
        [2, 9],
        [1, 6],
        [3, 4],
        [0, 2],
        [6, 0],
        [9, -3]
      ]
      actual = []
      subject.each { |i| actual.push(i) }
      _(actual).must_equal(expected)
    end

    it "does not remove any elements" do
      subject.each {}
      _(subject.peek_element).must_equal(9)
    end

    describe "without a block" do
      it "returns the enumerator" do
        _(subject.each).must_be_kind_of(Enumerator)
      end
    end
  end
end
