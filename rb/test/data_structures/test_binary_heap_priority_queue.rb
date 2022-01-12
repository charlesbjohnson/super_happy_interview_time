# frozen_string_literal: true

require("config")
require("data_structures/binary_heap_priority_queue")

describe(DataStructures::BinaryHeapPriorityQueue) {
  subject { DataStructures::BinaryHeapPriorityQueue.new(priority) }

  let(:priority) { ->(a, b) { a >= b } }

  it { _(subject).must_be_kind_of(Enumerable) }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:push) }
  it { _(subject).must_respond_to(:peek) }
  it { _(subject).must_respond_to(:pop) }

  describe("#size") {
    it("starts out empty") {
      _(subject.size).must_equal(0)
    }

    it("is increased on a #push") {
      subject.push(1)
      _(subject.size).must_equal(1)
    }

    it("stays the same on a #peek") {
      subject.push(1)
      _(subject.size).must_equal(1)

      subject.peek
      _(subject.size).must_equal(1)
    }

    it("is decreased on a #pop") {
      subject.push(1)
      subject.pop
      _(subject.size).must_equal(0)
    }

    it("stays the same on #each") {
      [1, 2, 3, 4].each { |i| subject.push(i) }
      subject.each {}
      _(subject.size).must_equal(4)
    }
  }

  describe("#push") {
    it("adds to the priority queue") {
      subject.push(1)
      _(subject.peek).must_equal(1)
    }

    describe("when it already contains elements") {
      before { [1, 5, -3, 4, 6].each { |i| subject.push(i) } }

      it("adds according to the priority") {
        subject.push(2)
        _(subject.peek).must_equal(6)
      }
    }

    describe("with a comparable priority") {
      let(:priority) { ->(a, b) { a <=> b } }

      before { [1, 0, 1, 2, 1].each { |i| subject.push(i) } }

      it("prioritizes the positive comparison") {
        _(subject.peek).must_equal(2)
      }
    }
  }

  describe("#peek") {
    before { [-1, 5, 2].each { |i| subject.push(i) } }

    it("returns the element with the highest priority") {
      _(subject.peek).must_equal(5)
    }

    it("does not remove the element from the priority queue") {
      _(subject.peek).must_equal(5)
      _(subject.peek).must_equal(5)
    }

    describe("when empty") {
      let(:empty) { DataStructures::BinaryHeapPriorityQueue.new(priority) }

      it("returns nil") {
        _(empty.peek).must_be_nil
      }
    }
  }

  describe("#pop") {
    before { [3, -1, 4, 9].each { |i| subject.push(i) } }

    it("returns the element with the highest priority") {
      _(subject.pop).must_equal(9)
    }

    it("removes the element from the priority queue") {
      subject.pop
      _(subject.pop).wont_equal(9)
    }

    it("resolves the next highest priority element") {
      _(subject.pop).must_equal(9)
      _(subject.pop).must_equal(4)
      _(subject.pop).must_equal(3)
    }

    describe("when empty") {
      let(:empty) { DataStructures::BinaryHeapPriorityQueue.new(priority) }

      it("returns nil") {
        _(empty.pop).must_be_nil
      }
    }
  }

  describe("#each") {
    before { [8, 3, -11, 10, 1].each { |i| subject.push(i) } }

    it("yields each element by the highest priority") {
      expected = [10, 8, 3, 1, -11]
      actual = []
      subject.each { |i| actual.push(i) }
      _(actual).must_equal(expected)
    }

    it("does not remove any elements") {
      subject.each {}
      _(subject.peek).must_equal(10)
    }

    describe("without a block") {
      it("returns the enumerator") {
        _(subject.each).must_be_kind_of(Enumerator)
      }
    }
  }
}
