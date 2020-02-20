# typed: false
# frozen_string_literal: true

require 'config'
require 'data_structures/queue'

describe DataStructures::Queue do
  subject { DataStructures::Queue.new }

  it { _(subject).must_respond_to :size }
  it { _(subject).must_respond_to :each }
  it { _(subject).must_respond_to :peek }
  it { _(subject).must_respond_to :enqueue }
  it { _(subject).must_respond_to :dequeue }

  let(:foo) { 'foo' }

  it 'starts out empty' do
    _(subject.size).must_equal(0)
  end

  describe '#enqueue' do
    it 'adds to the queue' do
      subject.enqueue(foo)
      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(1)
    end

    it 'adds to the back' do
      subject.enqueue(foo)
      subject.enqueue('bar')
      subject.enqueue('baz')

      _(subject.peek).must_equal(foo)
      _(subject.size).must_equal(3)
    end
  end

  describe '#peek' do
    it 'returns the item at the front' do
      subject.enqueue(foo)
      subject.enqueue('bar')

      _(subject.peek).must_equal(foo)
    end

    it 'does not remove the item' do
      subject.enqueue(foo)
      subject.peek

      _(subject.size).must_equal(1)
    end

    it 'returns nil if empty' do
      _(subject.peek).must_be_nil
    end
  end

  describe '#dequeue' do
    it 'returns the item at the front' do
      subject.enqueue(foo)
      subject.enqueue('bar')

      _(subject.dequeue).must_equal(foo)
    end

    it 'removes the item' do
      subject.enqueue(foo)
      subject.dequeue

      _(subject.size).must_equal(0)
    end

    it 'returns nil if empty' do
      _(subject.dequeue).must_be_nil
    end

    describe 'multiple' do
      it 'returns nil every time' do
        3.times { _(subject.dequeue).must_be_nil }
      end
    end
  end

  describe '#each' do
    it 'yields each item' do
      expected = %w[foo bar baz]
      expected.each { |item| subject.enqueue(item) }

      _(subject.each).must_be_kind_of(Enumerator)

      actual = []
      subject.each { |item| actual << item }
      _(actual).must_equal(expected)
    end
  end
end
