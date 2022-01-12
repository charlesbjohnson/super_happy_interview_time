# frozen_string_literal: true

require("config")
require("data_structures/binary_heap_indexed_priority_queue")

describe(DataStructures::BinaryHeapIndexedPriorityQueue) {
  subject { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

  let(:priority) { ->(a, b) { a >= b } }

  it { _(subject).must_be_kind_of(Enumerable) }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:insert) }
  it { _(subject).must_respond_to(:include_index?) }
  it { _(subject).must_respond_to(:include_element?) }
  it { _(subject).must_respond_to(:empty?) }
  it { _(subject).must_respond_to(:element_at) }
  it { _(subject).must_respond_to(:peek_index) }
  it { _(subject).must_respond_to(:peek_element) }
  it { _(subject).must_respond_to(:pop) }
  it { _(subject).must_respond_to(:change_element_at) }
  it { _(subject).must_respond_to(:delete_element_at) }

  describe("#size") {
    it("starts out empty") {
      _(subject.size).must_equal(0)
    }

    it("is increased on an #insert") {
      subject.insert(0, 1)
      _(subject.size).must_equal(1)
    }

    it("stays the same on a #peek_index") {
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.peek_index
      _(subject.size).must_equal(1)
    }

    it("stays the same on a #peek_element") {
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.peek_element
      _(subject.size).must_equal(1)
    }

    it("is decreased on a #pop") {
      subject.insert(0, 1)
      subject.pop
      _(subject.size).must_equal(0)
    }

    it("stays the same on a #change_element_at") {
      subject.insert(0, 1)
      _(subject.size).must_equal(1)

      subject.change_element_at(0, 2)
      _(subject.size).must_equal(1)
    }

    it("is decreased on a #delete_element_at") {
      subject.insert(0, 1)
      subject.delete_element_at(0)
      _(subject.size).must_equal(0)
    }

    it("stays the same on #each") {
      [1, 2, 3, 4].each { |i| subject.insert(i, i) }
      subject.each {}
      _(subject.size).must_equal(4)
    }
  }

  describe("#insert") {
    it("inserts a element at an index") {
      subject.insert(3, 5)
      _(subject.include_index?(3)).must_equal(true)
      _(subject.include_element?(5)).must_equal(true)
    }

    describe("invalid index") {
      describe("when index is negative") {
        it("does nothing") {
          subject.insert(-3, 5)
          _(subject.include_index?(-3)).must_equal(false)
          _(subject.include_element?(5)).must_equal(false)
        }
      }

      describe("when index is already bound to an element") {
        before { subject.insert(3, 0) }

        it("does nothing") {
          subject.insert(3, 5)
          _(subject.include_index?(3)).must_equal(true)
          _(subject.include_element?(5)).must_equal(false)
          _(subject.include_element?(0)).must_equal(true)
        }
      }
    }

    describe("when it already contains elements") {
      before {
        [
          [1, 6],
          [6, 0],
          [9, -3],
          [0, 2],
          [2, 9],
          [3, 4]
        ].each { |i, e| subject.insert(i, e) }
      }

      it("inserts according to the priority") {
        _(subject.peek_element).must_equal(9)
        _(subject.peek_index).must_equal(2)
      }
    }

    describe("with a comparable priority") {
      let(:priority) { ->(a, b) { a <=> b } }

      before {
        [
          [1, 3],
          [3, 1],
          [8, -9],
          [0, 7],
          [2, 5]
        ].each { |i, e| subject.insert(i, e) }
      }

      it("prioritizes the positive comparison") {
        _(subject.peek_element).must_equal(7)
        _(subject.peek_index).must_equal(0)
      }
    }
  }

  describe("#include_index?") {
    describe("when there is a key for the index") {
      before { subject.insert(3, 5) }

      it("returns true") {
        _(subject.include_index?(3)).must_equal(true)
      }
    }

    describe("when there is not a key for the index") {
      it("returns false") {
        _(subject.include_index?(3)).must_equal(false)
      }
    }
  }

  describe("#include_element?") {
    describe("when the element exists in the priority queue") {
      before { subject.insert(3, 5) }

      it("returns true") {
        _(subject.include_element?(5)).must_equal(true)
      }
    }

    describe("when the element does not exist in the priority queue") {
      it("returns false") {
        _(subject.include_element?(5)).must_equal(false)
      }
    }
  }

  describe("#empty?") {
    describe("when the priority queue is empty") {
      it("returns true") {
        _(subject).must_be(:empty?)
      }
    }

    describe("when the priority queue is not empty") {
      before { subject.insert(3, 5) }

      it("returns false") {
        _(subject).wont_be(:empty?)
      }
    }
  }

  describe("#element_at") {
    describe("when the index exists in the priority queue") {
      before { subject.insert(3, 5) }

      it("returns the element for the given index") {
        _(subject.element_at(3)).must_equal(5)
      }
    }

    describe("when the index does not exist in the priority queue") {
      it("returns nil") {
        _(subject.element_at(3)).must_be_nil
      }
    }
  }

  describe("#peek_index") {
    before {
      [
        [1, 3],
        [3, 5],
        [8, 1]
      ].each { |i, e| subject.insert(i, e) }
    }

    it("returns the index for the highest priority key") {
      _(subject.peek_index).must_equal(3)
    }

    it("does not remove the index from the priority queue") {
      _(subject.peek_index).must_equal(3)
      _(subject.peek_index).must_equal(3)
    }

    it("does not remove the element for that index from the priority queue") {
      _(subject.peek_index).must_equal(3)
      _(subject.peek_element).must_equal(5)
      _(subject.element_at(subject.peek_index)).must_equal(5)
    }

    describe("when empty") {
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it("returns nil") {
        _(empty.peek_index).must_be_nil
      }
    }
  }

  describe("#peek_element") {
    before {
      [
        [3, 5],
        [0, 7],
        [6, 2]
      ].each { |i, e| subject.insert(i, e) }
    }

    it("returns the element with the highest priority") {
      _(subject.peek_element).must_equal(7)
    }

    it("does not remove the element from the priority queue") {
      _(subject.peek_element).must_equal(7)
      _(subject.peek_element).must_equal(7)
    }

    it("does not remove the index for that element from the priority queue") {
      _(subject.peek_element).must_equal(7)
      _(subject.peek_index).must_equal(0)
    }

    describe("when empty") {
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it("returns nil") {
        _(empty.peek_element).must_be_nil
      }
    }
  }

  describe("#pop") {
    before {
      [
        [4, 6],
        [2, 0],
        [7, 1],
        [3, 7],
        [5, 3]
      ].each { |i, e| subject.insert(i, e) }
    }

    it("returns the element with the highest priority") {
      _(subject.pop).must_equal(7)
    }

    it("removes the element from the priority queue") {
      subject.pop
      _(subject.pop).wont_equal(7)
    }

    it("removes the index for the element that was popped") {
      subject.pop
      _(subject.include_index?(3)).must_equal(false)
    }

    it("resolves the next highest priority element for each invocation") {
      _(subject.pop).must_equal(7)
      _(subject.pop).must_equal(6)
      _(subject.pop).must_equal(3)
    }

    describe("when empty") {
      let(:empty) { DataStructures::BinaryHeapIndexedPriorityQueue.new(priority) }

      it("returns nil") {
        _(empty.pop).must_be_nil
      }
    }
  }

  describe("#change_element_at") {
    describe("when the index exists in the priority queue") {
      before {
        [
          [4, 6],
          [2, 0],
          [5, 3],
          [1, 4],
          [7, 8],
          [9, 2]
        ].each { |i, e| subject.insert(i, e) }
      }

      it("changes the element for the given index") {
        subject.change_element_at(2, 10)
        _(subject.element_at(2)).must_equal(10)
      }

      describe("when increasing the priority at the index") {
        it("maintains priority") {
          subject.change_element_at(2, 10)
          _(subject.peek_element).must_equal(10)
        }
      }

      describe("when decreasing the priority at the index") {
        it("maintains priority") {
          subject.change_element_at(7, 1)
          _(subject.peek_element).must_equal(6)
        }
      }

      describe("with multiple operations") {
        before {
          subject.insert(6, 9)
          subject.pop
          subject.delete_element_at(1)
          subject.change_element_at(9, 7)
        }

        it("maintains priority") {
          _(subject.pop).must_equal(8)
          _(subject.pop).must_equal(7)
          _(subject.pop).must_equal(6)
          _(subject.pop).must_equal(3)
          _(subject.pop).must_equal(0)
          _(subject.pop).must_be_nil
        }
      }
    }

    describe("when the index does not exist in the priority queue") {
      it("does nothing") {
        subject.change_element_at(0, 9)
        _(subject.element_at(0)).must_be_nil
      }
    }
  }

  describe("#delete_element_at") {
    before {
      [
        [4, 6],
        [2, 0],
        [5, 3],
        [9, 8],
        [3, 1],
        [7, 4],
        [8, 2]
      ].each { |i, e| subject.insert(i, e) }
    }

    it("deletes the element at the given index") {
      subject.delete_element_at(4)
      _(subject.element_at(4)).must_be_nil
    }

    it("deletes the index") {
      subject.delete_element_at(4)
      _(subject.include_index?(4)).must_equal(false)
    }

    it("maintains priority") {
      subject.delete_element_at(4)
      _(subject.peek_element).must_equal(8)
    }

    describe("with multiple operationss") {
      before {
        subject.delete_element_at(4)
        subject.insert(1, 7)
        subject.pop
      }

      it("maintains priority") {
        _(subject.pop).must_equal(7)
        _(subject.pop).must_equal(4)
        _(subject.pop).must_equal(3)
        _(subject.pop).must_equal(2)
        _(subject.pop).must_equal(1)
        _(subject.pop).must_equal(0)
        _(subject.pop).must_be_nil
      }
    }

    describe("when the index does not exist in the priority queue") {
      it("does nothing") {
        subject.delete_element_at(0)
        _(subject.element_at(0)).must_be_nil
      }
    }
  }

  describe("#each") {
    before {
      [
        [1, 6],
        [6, 0],
        [9, -3],
        [0, 2],
        [2, 9],
        [3, 4]
      ].each { |i, e| subject.insert(i, e) }
    }

    it("yields each index and element by the highest priority") {
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
    }

    it("does not remove any elements") {
      subject.each {}
      _(subject.peek_element).must_equal(9)
    }

    describe("without a block") {
      it("returns the enumerator") {
        _(subject.each).must_be_kind_of(Enumerator)
      }
    }
  }
}
