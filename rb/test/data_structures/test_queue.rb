# frozen_string_literal: true

require("config")
require("data_structures/queue")

describe(DataStructures::Queue) {
  subject { DataStructures::Queue.new }

  it { _(subject).must_respond_to(:size) }
  it { _(subject).must_respond_to(:each) }
  it { _(subject).must_respond_to(:peek) }
  it { _(subject).must_respond_to(:enqueue) }
  it { _(subject).must_respond_to(:dequeue) }

  let(:foo) { "foo" }

  it("starts out empty") {
    _(subject.size).must_equal(0)
  }

  describe("#enqueue") {
    it("adds to the queue") {
      subject.enqueue(foo)
      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(1)
    }

    it("adds to the back") {
      subject.enqueue(foo)
      subject.enqueue("bar")
      subject.enqueue("baz")

      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(3)
    }
  }

  describe("#peek") {
    it("returns the item at the front") {
      subject.enqueue(foo)
      subject.enqueue("bar")

      _(subject.peek).must_equal(foo)
    }

    it("does not remove the item") {
      subject.enqueue(foo)
      subject.peek

      _(subject.size).must_equal(1)
    }

    it("returns nil if empty") {
      _(subject.peek).must_be_nil
    }
  }

  describe("#dequeue") {
    it("returns the item at the front") {
      subject.enqueue(foo)
      subject.enqueue("bar")

      _(subject.dequeue).must_equal(foo)
    }

    it("removes the item") {
      subject.enqueue(foo)
      subject.dequeue

      _(subject.size).must_equal(0)
    }

    it("returns nil if empty") {
      _(subject.dequeue).must_be_nil
    }

    describe("multiple") {
      it("returns nil every time") {
        3.times { _(subject.dequeue).must_be_nil }
      }
    }
  }

  describe("#each") {
    it("yields each item") {
      expected = %w[foo bar baz]
      expected.each { |item| subject.enqueue(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    }
  }
}
