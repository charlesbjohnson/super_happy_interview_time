# typed: true
# frozen_string_literal: true

require 'pathname'

require_relative './slug'

module Refactor
  module Util
    class Path
      LIB_DIR  = 'lib'
      TEST_DIR = 'test'

      Params = Struct.new(
        :root,
        :source,
        :slug,
        :extension,
        :is_test
      ) do
        def join
          "#{path}#{extension}"
        end

        private

        def path
          File.join([root, source, prefixed_slug].reject(&:empty?))
        end

        def prefixed_slug
          "#{is_test ? 'test_' : ''}#{slug}"
        end
      end

      #
      # lib/ctci/chapter_one/one.rb
      # => lib/ctci/ctci_c1_p1.rb
      #
      # test/ctci/chapter_one/one.rb
      # => test/ctci/test_ctci_c1_p1.rb
      #
      def self.for_file(str)
        construct(str).join
      end

      #
      # lib/ctci/chapter_one/one.rb
      # => ctci/ctci_c1_p1
      #
      def self.for_require(str)
        params = construct(str)

        params.root      = ''
        params.extension = ''
        params.is_test   = false

        params.join
      end

      private

      private_constant \
        :LIB_DIR,
        :Params,
        :TEST_DIR

      private_class_method def self.construct(str)
        parts = split(str)

        is_lib  = parts.any? { |part| LIB_DIR == part }
        is_test = parts.any? { |part| TEST_DIR == part }

        raise 'given path must specify root' if !is_lib && !is_test

        extension                        = File.extname(str)
        dir                              = is_lib ? LIB_DIR : TEST_DIR
        root, (source, chapter, problem) = partition(parts, dir)

        Params.new(
          root,
          source,
          Slug.generate(
            source,
            chapter,
            problem
          ),
          extension,
          is_test
        )
      end

      #
      # lib/epi/chapter_five/one.rb
      # => [lib epi chapter_five one]
      #
      private_class_method def self.split(path)
        Pathname.new(path)
                .each_filename
                .map { |part| File.basename(part, File.extname(part)) }
      end

      #
      # lib/epi/chapter_five/one.rb
      # => [[lib] [epi chapter_five one.rb]]
      #
      private_class_method def self.partition(parts, dir)
        index = parts.find_index(dir)
        [parts[0..index], parts[(index + 1)..-1]]
      end
    end
  end
end
