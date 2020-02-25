# typed: false
# frozen_string_literal: true

require "config"
require "data_structures/binary_heap_priority_queue"

describe DataStructures::BinaryHeapPriorityQueue do
  subject { DataStructures::BinaryHeapPriorityQueue.new(priority) }

  let(:priority) { ->(a, b) { a >= b } }

  it { _(subject).must_be_kind_of(Enumerable) }

  it { _(subject).must_respond_to :size }
  it { _(subject).must_respond_to :each }
  it { _(subject).must_respond_to :push }
  it { _(subject).must_respond_to :peek }
  it { _(subject).must_respond_to :pop }

  describe "#size" do
    it "starts out empty" do
      _(subject.size).must_equal(0)
    end

    it "is increased on a #push" do
      subject.push(1)
      _(subject.size).must_equal(1)
    end

    it "stays the same on a #peek" do
      subject.push(1)
      _(subject.size).must_equal(1)

      subject.peek
      _(subject.size).must_equal(1)
    end

    it "is decreased on a #pop" do
      subject.push(1)
      subject.pop
      _(subject.size).must_equal(0)
    end

    it "stays the same on #each" do
      [1, 2, 3, 4].each { |i| subject.push(i) }
      subject.each {}
      _(subject.size).must_equal(4)
    end
  end

  describe "#push" do
    it "adds to the priority queue" do
      subject.push(1)
      _(subject.peek).must_equal(1)
    end

    describe "when it already contains elements" do
      before { [1, 5, -3, 4, 6].each { |i| subject.push(i) } }

      it "adds according to the priority" do
        subject.push(2)
        _(subject.peek).must_equal(6)
      end
    end

    describe "with a comparable priority" do
      let(:priority) { ->(a, b) { a <=> b } }

      before { [1, 0, 1, 2, 1].each { |i| subject.push(i) } }

      it "prioritizes the positive comparison" do
        _(subject.peek).must_equal(2)
      end
    end
  end

  describe "#peek" do
    before { [-1, 5, 2].each { |i| subject.push(i) } }

    it "returns the element with the highest priority" do
      _(subject.peek).must_equal(5)
    end

    it "does not remove the element from the priority queue" do
      _(subject.peek).must_equal(5)
      _(subject.peek).must_equal(5)
    end

    describe "when empty" do
      let(:empty) { DataStructures::BinaryHeapPriorityQueue.new(priority) }

      it "returns nil" do
        _(empty.peek).must_be_nil
      end
    end
  end

  describe "#pop" do
    before { [3, -1, 4, 9].each { |i| subject.push(i) } }

    it "returns the element with the highest priority" do
      _(subject.pop).must_equal(9)
    end

    it "removes the element from the priority queue" do
      subject.pop
      _(subject.pop).wont_equal(9)
    end

    it "resolves the next highest priority element" do
      _(subject.pop).must_equal(9)
      _(subject.pop).must_equal(4)
      _(subject.pop).must_equal(3)
    end

    describe "when empty" do
      let(:empty) { DataStructures::BinaryHeapPriorityQueue.new(priority) }

      it "returns nil" do
        _(empty.pop).must_be_nil
      end
    end
  end

  describe "#each" do
    before { [8, 3, -11, 10, 1].each { |i| subject.push(i) } }

    it "yields each element by the highest priority" do
      expected = [10, 8, 3, 1, -11]
      actual = []
      subject.each { |i| actual.push(i) }
      _(actual).must_equal(expected)
    end

    it "does not remove any elements" do
      subject.each {}
      _(subject.peek).must_equal(10)
    end

    describe "without a block" do
      it "returns the enumerator" do
        _(subject.each).must_be_kind_of(Enumerator)
      end
    end
  end
end
