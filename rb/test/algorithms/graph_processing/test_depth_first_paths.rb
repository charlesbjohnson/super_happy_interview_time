# typed: false
# frozen_string_literal: true

require "config"

require "algorithms/graph_processing/depth_first_paths"
require "data_structures/undirected_graph"

describe Algorithms::GraphProcessing::DepthFirstPaths do
  subject { Algorithms::GraphProcessing::DepthFirstPaths.new(graph, 0) }

  let(:graph) { DataStructures::UndirectedGraph.new }

  it { _(subject).must_respond_to :path_to? }
  it { _(subject).must_respond_to :path_to }

  describe "with an undirected graph" do
    let(:edges) do
      [
        [0, 1],
        [0, 2],
        [0, 5],
        [0, 6],
        [3, 4],
        [3, 5],
        [4, 5],
        [4, 6],
        [7, 8],
        [9, 10],
        [9, 11],
        [9, 12]
      ]
    end

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe "#path_to?" do
      it "returns true if there is a path to the target from the source" do
        _(subject.path_to?(3)).must_equal(true)
      end

      it "returns false if there is no path to the target from the source" do
        _(subject.path_to?(9)).must_equal(false)
      end
    end

    describe "#path_to" do
      it "returns a path to the target when there is one" do
        _([[0, 5, 3], [0, 6, 4, 3]].any? { |path|
          subject.path_to(3) == path
        }).must_equal(true)
      end

      it "returns nil when there is no path to the target" do
        _(subject.path_to(9)).must_be_nil
      end
    end
  end

  describe "with an directed graph" do
    let(:graph) { DataStructures::DirectedGraph.new }
    let(:edges) do
      [
        [0, 1],
        [0, 5],
        [2, 0],
        [2, 3],
        [3, 2],
        [3, 5],
        [4, 2],
        [4, 3],
        [5, 4],
        [6, 0],
        [6, 4],
        [6, 9],
        [7, 6],
        [7, 8],
        [8, 7],
        [8, 9],
        [9, 10],
        [9, 11],
        [10, 12],
        [11, 12],
        [12, 9]
      ]
    end

    before { edges.each { |from, to| graph.add_edge(from, to) } }

    describe "#path_to?" do
      it "returns true if there is a path to the target from the source" do
        _(subject.path_to?(3)).must_equal(true)
      end

      it "returns false if there is no path to the target from the source" do
        _(subject.path_to?(9)).must_equal(false)
      end
    end

    describe "#path_to" do
      it "returns a path to the target when there is one" do
        _([[0, 5, 4, 3], [0, 5, 4, 2, 3]].any? { |path|
          subject.path_to(3) == path
        }).must_equal(true)
      end

      it "returns an empty array when there is no path to the target" do
        _(subject.path_to(9)).must_be_nil
      end
    end
  end
end
