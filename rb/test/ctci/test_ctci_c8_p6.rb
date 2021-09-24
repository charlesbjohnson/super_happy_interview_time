# typed: false
# frozen_string_literal: true

require("config")
require("ctci/ctci_c8_p6")

module CTCI
  module C8
    module P6
      describe(JigSaw) {
        subject { JigSaw.new }

        it { _(subject).must_respond_to(:board) }
        it { _(subject).must_respond_to(:unplaced) }
        it { _(subject).must_respond_to(:columns) }
        it { _(subject).must_respond_to(:rows) }
        it { _(subject).must_respond_to(:solve) }

        describe("::new") {
          it("creates a 3x3 board by default") do
            _(subject.unplaced.size).must_equal(9)
            _(subject.board.size).must_equal(3)
            _(subject.board.first.size).must_equal(3)
          end

          it("creates pieces for each position in the puzzle") do
            subject.unplaced.each { |p| _(p).must_be_kind_of(Piece) }
            _(subject.unplaced.count(&:corner?)).must_equal(4)
            _(subject.unplaced.count { |p| p.top.flat? }).must_equal(3)
            _(subject.unplaced.count { |p| p.right.flat? }).must_equal(3)
            _(subject.unplaced.count { |p| p.bottom.flat? }).must_equal(3)
            _(subject.unplaced.count { |p| p.left.flat? }).must_equal(3)
            _(subject.unplaced.count { |p| p.edges.all?(&:flat?) }).must_equal(0)
            _(subject.unplaced.count { |p| p.edges.none?(&:flat?) }).must_equal(1)
          end
        }

        describe("#solve") {
          it("fills the board so that each piece fits with those around it") do
            subject.solve

            _(subject.unplaced).must_be_empty

            all_fit = true
            subject.board.each_with_index { |r, ri|
              r.each_with_index { |c, ci|
                above_end = ri.pred.negative?
                right_end = ci.succ >= subject.columns
                below_end = ri.succ >= subject.rows
                left_end = ci.pred.negative?

                piece = c
                above = above_end ? nil : subject.board[ri.pred][ci].bottom
                right = right_end ? nil : subject.board[ri][ci.succ].left
                below = below_end ? nil : subject.board[ri.succ][ci].top
                left = left_end ? nil : subject.board[ri][ci.pred].right

                above_fits = piece.top.fits_with?(above)
                right_fits = piece.right.fits_with?(right)
                bottom_fits = piece.bottom.fits_with?(below)
                left_fits = piece.left.fits_with?(left)

                all_fit = [above_fits, right_fits, bottom_fits, left_fits].all?
                break unless all_fit
              }
              break unless all_fit
            }

            _(all_fit).must_equal(true)
          end
        }
      }

      describe(Piece) {
        # edges for a top left corner piece
        let(:edges) { [1, 2, 3, 1].map { |e| Edge.new(e) } }
        subject { Piece.new(edges) }

        it { _(Piece).must_respond_to(:empty) }
        it { _(Piece).must_respond_to(:that_fits_between) }

        it { _(subject).must_respond_to(:edges) }
        it { _(subject).must_respond_to(:top) }
        it { _(subject).must_respond_to(:right) }
        it { _(subject).must_respond_to(:bottom) }
        it { _(subject).must_respond_to(:left) }
        it { _(subject).must_respond_to(:corner?) }
        it { _(subject).must_respond_to(:empty?) }

        describe("piece constructors") {
          describe("::empty") {
            it("creates an empty piece that has no edges, a null Piece object") do
              _(Piece.empty.edges.all?(&:none?)).must_equal(true)
            end
          }

          describe("::that_fits_between") {
            it("creates a piece that fits between the given edges") do
              edges_around = [Edge.none, nil, Edge.inward, Edge.outward]
              piece = Piece.that_fits_between(edges_around)
              top = piece.top.type
              _(%i[inward outward].include?(top)).must_equal(true)
              _(piece.right).must_be(:flat?)
              _(piece.bottom).must_be(:outward?)
              _(piece.left).must_be(:inward?)
            end
          }
        }

        describe("edges") {
          describe("#edges") {
            it("returns edges from the top going clockwise") do
              _(subject.edges).must_equal(edges)
            end
          }

          describe("#top") {
            it { _(subject.top).must_equal(edges[0]) }
          }

          describe("#right") {
            it { _(subject.right).must_equal(edges[1]) }
          }

          describe("#bottom") {
            it { _(subject.bottom).must_equal(edges[2]) }
          }

          describe("#left") {
            it { _(subject.left).must_equal(edges[3]) }
          }
        }

        describe("piece edge checking") {
          describe("#corner?") {
            it("returns true if two consecutive edges are both flat") do
              # start at top left, going counter clockwise
              _(subject).must_be(:corner?)
              _(Piece.new(edges.rotate)).must_be(:corner?)
              _(Piece.new(edges.rotate(2))).must_be(:corner?)
              _(Piece.new(edges.rotate(3))).must_be(:corner?)
            end

            it("returns false if not a corner piece") do
              flat_top_bottom = [1, 2, 1, 3].map { |e| Edge.new(e) }
              _(Piece.new(flat_top_bottom)).wont_be(:corner?)

              flat_left_right = [2, 1, 3, 1].map { |e| Edge.new(e) }
              _(Piece.new(flat_left_right)).wont_be(:corner?)

              none_flat = [2, 3, 3, 2].map { |e| Edge.new(e) }
              _(Piece.new(none_flat)).wont_be(:corner?)

              _(Piece.empty).wont_be(:corner?)
            end
          }

          describe("#empty?") {
            it do
              _(Piece.empty).must_be(:empty?)
              _(subject).wont_be(:empty?)
            end
          }
        }
      }

      describe(Edge) {
        subject { Edge.new(0) }
        let(:none) { subject }
        let(:flat) { Edge.new(1) }
        let(:inward) { Edge.new(2) }
        let(:outward) { Edge.new(3) }

        it { _(Edge).must_respond_to(:none) }
        it { _(Edge).must_respond_to(:flat) }
        it { _(Edge).must_respond_to(:inward) }
        it { _(Edge).must_respond_to(:outward) }
        it { _(Edge).must_respond_to(:rand_in_out) }
        it { _(Edge).must_respond_to(:complement) }

        it { _(subject).must_respond_to(:type) }
        it { _(subject).must_respond_to(:fits_with?) }
        it { _(subject).must_respond_to(:flat?) }
        it { _(subject).must_respond_to(:inward?) }
        it { _(subject).must_respond_to(:outward?) }

        describe("edge constructors") {
          describe("::none") {
            it { _(Edge.none.type).must_equal(:none) }
          }

          describe("::flat") {
            it { _(Edge.flat.type).must_equal(:flat) }
          }

          describe("::rand_in_out") {
            it("returns either an inward or outward edge randomly") do
              r = Array.new(10) { Edge.rand_in_out }
              _(r.all? { |e| e.type == :inward }).must_equal(false)
              _(r.all? { |e| e.type == :outward }).must_equal(false)
              _(r.all? { |e| e.type == :flat }).must_equal(false)
              _(r.all? { |e| e.type == :inward || e.type == :outward }).must_equal(true)
            end
          }

          describe("::complement") {
            it("returns an edge depending on the type of edge given") do
              none_complement = Edge.complement(none).type
              is_inward = none_complement == :inward
              is_outward = none_complement == :outward
              _(is_inward || is_outward).must_equal(true)

              _(Edge.complement(flat).type).must_equal(:flat)
              _(Edge.complement(inward).type).must_equal(:outward)
              _(Edge.complement(outward).type).must_equal(:inward)
            end

            it("returns a flat edge if no edge or nil given") do
              _(Edge.complement.type).must_equal(:flat)
              _(Edge.complement(nil).type).must_equal(:flat)
            end
          }
        }

        describe("#fits_with?") {
          it do
            _(none).must_be(:fits_with?, none.clone)
            _(none).must_be(:fits_with?, inward)
            _(none).must_be(:fits_with?, outward)
            _(none).wont_be(:fits_with?, flat)
            _(none).wont_be(:fits_with?, nil)
          end

          it do
            _(flat).wont_be(:fits_with?, none)
            _(flat).wont_be(:fits_with?, inward)
            _(flat).wont_be(:fits_with?, outward)
            _(flat).must_be(:fits_with?, flat.clone)
            _(flat).must_be(:fits_with?, nil)
          end

          it do
            _(inward).must_be(:fits_with?, none)
            _(inward).wont_be(:fits_with?, inward.clone)
            _(inward).must_be(:fits_with?, outward)
            _(inward).wont_be(:fits_with?, flat)
            _(inward).wont_be(:fits_with?, nil)
          end

          it do
            _(outward).must_be(:fits_with?, none)
            _(outward).must_be(:fits_with?, inward)
            _(outward).wont_be(:fits_with?, outward.clone)
            _(outward).wont_be(:fits_with?, flat)
            _(outward).wont_be(:fits_with?, nil)
          end
        }

        describe("edge checking") {
          describe("#none?") {
            it do
              _(none).must_be(:none?)
              _(flat).wont_be(:none?)
              _(inward).wont_be(:none?)
              _(outward).wont_be(:none?)
            end
          }

          describe("#flat?") {
            it do
              _(none).wont_be(:flat?)
              _(flat).must_be(:flat?)
              _(inward).wont_be(:flat?)
              _(outward).wont_be(:flat?)
            end
          }

          describe("#inward?") {
            it do
              _(none).wont_be(:inward?)
              _(flat).wont_be(:inward?)
              _(inward).must_be(:inward?)
              _(outward).wont_be(:inward?)
            end
          }

          describe("#outward?") {
            it do
              _(none).wont_be(:outward?)
              _(flat).wont_be(:outward?)
              _(outward).must_be(:outward?)
              _(inward).wont_be(:outward?)
            end
          }
        }
      }
    end
  end
end
