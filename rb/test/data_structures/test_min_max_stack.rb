# typed: false
# frozen_string_literal: true

require "config"
require "data_structures/min_max_stack"

describe DataStructures::MinMaxStack do
  subject { DataStructures::MinMaxStack.new }

  it { _(subject).must_respond_to :size }
  it { _(subject).must_respond_to :each }
  it { _(subject).must_respond_to :peek }
  it { _(subject).must_respond_to :push }
  it { _(subject).must_respond_to :pop }
  it { _(subject).must_respond_to :min }
  it { _(subject).must_respond_to :max }

  let(:foo) { "foo" }

  it "starts out empty" do
    _(subject.size).must_equal(0)
  end

  describe "#push" do
    it "adds to the stack" do
      subject.push(foo)
      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(1)
    end

    it "adds to the top" do
      subject.push("baz")
      subject.push("bar")
      subject.push(foo)

      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(3)
    end

    it "returns what was pushed" do
      _(subject.push(foo)).must_equal(foo)
    end

    describe "when the item is not comparable to others in the stack" do
      it "is not added" do
        subject.push(1)
        _(subject.size).must_equal(1)

        subject.push("")
        _(subject.size).must_equal(1)
        _(subject.peek).must_equal(1)
      end

      it "returns nil" do
        subject.push(1)
        _(subject.push("")).must_be_nil
      end
    end
  end

  describe "#peek" do
    it "returns the item at the top" do
      subject.push("bar")
      subject.push(foo)

      _(subject.peek).must_equal(foo)
    end

    it "does not remove the item" do
      subject.push(foo)
      subject.peek

      _(subject.size).must_equal(1)
    end

    it "returns nil if empty" do
      _(subject.peek).must_be_nil
    end
  end

  describe "#pop" do
    it "returns the item at the top" do
      subject.push("bar")
      subject.push(foo)

      _(subject.pop).must_equal(foo)
    end

    it "removes the item" do
      subject.push(foo)
      subject.pop

      _(subject.size).must_equal(0)
    end

    it "returns nil if empty" do
      _(subject.pop).must_be_nil
    end

    describe "multiple" do
      it "returns nil every time" do
        3.times { _(subject.pop).must_be_nil }
      end
    end
  end

  describe "#each" do
    it "yields each item" do
      expected = %w[foo bar baz]
      expected.reverse_each { |item| subject.push(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    end
  end

  describe "#min" do
    it "returns the minimum item" do
      subject.push(2)
      subject.push(8)
      subject.push(0)

      _(subject.min).must_equal(0)
    end

    it "does not remove any item" do
      subject.push(1)
      subject.push(0)

      subject.min
      _(subject.size).must_equal(2)
    end

    it "returns nil if empty" do
      _(subject.min).must_be_nil
    end

    describe "when the minimum changes" do
      it "changes accordingly" do
        subject.push(2)
        subject.push(8)

        _(subject.min).must_equal(2)

        subject.push(1)
        _(subject.min).must_equal(1)

        subject.pop
        _(subject.min).must_equal(2)
      end
    end
  end

  describe "#max" do
    it "returns the maximum item" do
      subject.push(2)
      subject.push(8)
      subject.push(0)

      _(subject.max).must_equal(8)
    end

    it "does not remove any item" do
      subject.push(1)
      subject.push(0)

      subject.max
      _(subject.size).must_equal(2)
    end

    it "returns nil if empty" do
      _(subject.max).must_be_nil
    end

    describe "when the maximum changes" do
      it "changes accordingly" do
        subject.push(8)
        subject.push(2)

        _(subject.max).must_equal(8)

        subject.push(10)
        _(subject.max).must_equal(10)

        subject.pop
        _(subject.max).must_equal(8)
      end
    end
  end
end
