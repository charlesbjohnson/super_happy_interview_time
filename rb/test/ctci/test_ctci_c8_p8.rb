# frozen_string_literal: true

require("config")
require("ctci/ctci_c8_p8")

module CTCI
  module C8
    module P8
      describe(Othello) {
        subject { Othello.new }

        it { _(subject).must_respond_to(:board) }
        it { _(subject).must_respond_to(:size) }
        it { _(subject).must_respond_to(:black) }
        it { _(subject).must_respond_to(:white) }
        it { _(subject).must_respond_to(:remaining) }
        it { _(subject).must_respond_to(:place_token) }

        describe("::new") {
          it("creates a board with 8 columns and rows by default") {
            _(subject.board.size).must_equal(8)
            _(subject.board.first.size).must_equal(8)
            _(subject.size).must_equal(8)
          }

          it("starts two white and two black tokens in an X at the center") {
            black = subject.board[3][3], subject.board[4][4]
            white = subject.board[4][3], subject.board[3][4]
            _(black.all?(&:black?)).must_equal(true)
            _(white.all?(&:white?)).must_equal(true)

            _(subject.black).must_equal(2)
            _(subject.white).must_equal(2)
          }

          it("creates tokens for each position") {
            positions = subject.board.flatten
            positions.each { |t| _(t).must_be_kind_of(Token) }
            _(positions.count(&:none?)).must_equal(60)
            _(subject.remaining).must_equal(60)
          }
        }

        describe("#place_token") {
          it("puts a token at a position on the board") {
            _(subject.place_token(3, 5, :black)).must_equal(true)
            _(subject.board[3][5]).must_be(:black?)

            _(subject.place_token(4, 5, :white)).must_equal(true)
            _(subject.board[4][5]).must_be(:white?)
          }

          describe("flips tokens") {
            it("horizontally") {
              _(subject.board[3][4]).must_be(:white?)
              _(subject.place_token(3, 5, :black)).must_equal(true)

              _(subject.board[3][4]).must_be(:black?)
              _(subject.black).must_equal(4)
              _(subject.white).must_equal(1)
            }

            it("vertically") {
              _(subject.board[3][3]).must_be(:black?)
              _(subject.place_token(2, 3, :white)).must_equal(true)

              _(subject.board[2][3]).must_be(:white?)
              _(subject.white).must_equal(4)
              _(subject.black).must_equal(1)
            }

            it("diagonally") {
              _(subject.place_token(3, 2, :white)).must_equal(true)
              _(subject.board[3][3]).must_be(:white?)

              subject.place_token(2, 2, :black)
              _(subject.board[3][3]).must_be(:black?)
              _(subject.black).must_equal(3)
              _(subject.white).must_equal(3)
            }
          }

          describe("placement unavailable") {
            describe("at position specified") {
              it("does nothing") {
                _(subject.place_token(5, 3, :white)).must_equal(false)
                _(subject.board[5][3]).must_be(:none?)
                _(subject.white).must_equal(2)
              }
            }

            describe("out of tokens") {
              before {
                subject.board.each { |c| c.each(&:black!) }
                subject.send(:count_tokens)
              }

              it("does nothing") {
                _(subject.place_token(0, 0, :white)).must_equal(false)
                _(subject.board[0][0]).must_be(:black?)
                _(subject.black).must_equal(64)
                _(subject.remaining).must_equal(0)
              }
            }
          }

          describe("invalid") {
            it("does nothing if position doesnt exist") {
              _(subject.place_token(100, -100, :black)).must_equal(false)
              _(subject.remaining).must_equal(60)
              _(subject.black).must_equal(2)
              _(subject.white).must_equal(2)
            }
          }
        }
      }

      describe(Token) {
        subject { Token.new(0) }
        let(:none) { subject }
        let(:black) { Token.new(-1) }
        let(:white) { Token.new(1) }

        it { _(Token).must_respond_to(:colors) }
        it { _(Token).must_respond_to(:none) }
        it { _(Token).must_respond_to(:black) }
        it { _(Token).must_respond_to(:white) }

        it { _(subject).must_respond_to(:none?) }
        it { _(subject).must_respond_to(:black?) }
        it { _(subject).must_respond_to(:white?) }
        it { _(subject).must_respond_to(:color) }
        it { _(subject).must_respond_to(:black!) }
        it { _(subject).must_respond_to(:white!) }
        it { _(subject).must_respond_to(:flip!) }

        describe("color constructors") {
          describe("::none") {
            it { _(Token.none).must_equal(none) }
          }

          describe("::black") {
            it { _(Token.black).must_equal(black) }
          }

          describe("::white") {
            it { _(Token.white).must_equal(white) }
          }
        }

        describe("color checking") {
          describe("#color") {
            it {
              _(none.color).must_equal(:none)
              _(black.color).must_equal(:black)
              _(white.color).must_equal(:white)
            }
          }

          describe("#none?") {
            it {
              _(none).must_be(:none?)
              _(black).wont_be(:none?)
              _(white).wont_be(:none?)
            }
          }

          describe("#black?") {
            it {
              _(none).wont_be(:black?)
              _(black).must_be(:black?)
              _(white).wont_be(:black?)
            }
          }

          describe("#white?") {
            it {
              _(none).wont_be(:white?)
              _(white).must_be(:white?)
              _(black).wont_be(:white?)
            }
          }
        }

        describe("color changing") {
          describe("#none!") {
            it {
              _(none.none!).must_be(:none?)
              _(black.none!).must_be(:none?)
              _(white.none!).must_be(:none?)
            }
          }

          describe("#black!") {
            it {
              _(none.black!).must_be(:black?)
              _(black.black!).must_be(:black?)
              _(white.black!).must_be(:black?)
            }
          }

          describe("#white!") {
            it {
              _(none.white!).must_be(:white?)
              _(black.white!).must_be(:white?)
              _(white.white!).must_be(:white?)
            }
          }

          describe("#flip!") {
            it {
              _(none.flip!).must_be(:none?)
              _(white.flip!).must_be(:black?)
              _(black.flip!).must_be(:white?)
            }
          }
        }
      }
    end
  end
end
