# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rubocop-minitest/all/rubocop-minitest.rbi
#
# rubocop-minitest-0.15.0

module RuboCop
end
module RuboCop::Minitest
end
module RuboCop::Minitest::Version
  def self.document_version; end
end
module RuboCop::Minitest::Inject
  def self.defaults!; end
end
module RuboCop::Cop
end
module RuboCop::Cop::ArgumentRangeHelper
  def all_arguments_range(node); end
  def first_and_second_arguments_range(node); end
  def first_argument_range(node); end
  include RuboCop::Cop::RangeHelp
end
module RuboCop::Cop::InDeltaMixin
  def assertion_method; end
  def build_good_method(expected, actual, message); end
  def on_send(node); end
end
module RuboCop::Cop::MinitestCopRule
  def define_rule(assertion_method, target_method:, preferred_method: nil, inverse: nil); end
end
module RuboCop::Cop::MinitestExplorationHelpers
  def assertion?(node); end
  def assertion_method?(method_name); end
  def assertions(def_node); end
  def class_def_nodes(class_node); end
  def lifecycle_hook_method?(node); end
  def lifecycle_hooks(class_node); end
  def test_case?(node); end
  def test_case_name?(name); end
  def test_cases(class_node); end
  def test_class?(class_node); end
  extend RuboCop::AST::NodePattern::Macros
end
module RuboCop::Cop::Minitest
end
module RuboCop::Cop::Minitest::NilAssertionHandleable
  def autocorrect(corrector, node, actual); end
  def build_message(node, actual, message); end
  def comparison_assertion_method?(node); end
  def register_offense(node, actual, message); end
end
class RuboCop::Cop::Minitest::AssertEmpty < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertEmptyLiteral < RuboCop::Cop::Base
  def assert_equal_with_empty_literal(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertEqual < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertInDelta < RuboCop::Cop::Base
  def equal_floats_call(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::InDeltaMixin
end
class RuboCop::Cop::Minitest::AssertWithExpectedArgument < RuboCop::Cop::Base
  def assert_with_two_arguments?(param0 = nil); end
  def on_send(node); end
end
class RuboCop::Cop::Minitest::AssertionInLifecycleHook < RuboCop::Cop::Base
  def on_class(class_node); end
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::AssertKindOf < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertNil < RuboCop::Cop::Base
  def assertion_type; end
  def nil_assertion(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
  include RuboCop::Cop::Minitest::NilAssertionHandleable
end
class RuboCop::Cop::Minitest::AssertIncludes < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertInstanceOf < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertMatch < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertOutput < RuboCop::Cop::Base
  def find_test_case(node); end
  def on_gvasgn(node); end
  def references_gvar?(assertion, gvar_name); end
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::AssertPathExists < RuboCop::Cop::Base
  def assert_file_exists(param0 = nil); end
  def build_good_method(path, message); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
end
class RuboCop::Cop::Minitest::AssertRespondTo < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::AssertSilent < RuboCop::Cop::Base
  def assert_silent_candidate?(param0 = nil); end
  def empty_string?(node); end
  def on_block(node); end
  extend RuboCop::Cop::AutoCorrector
end
class RuboCop::Cop::Minitest::AssertTruthy < RuboCop::Cop::Base
  def assert_equal_with_truthy(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::GlobalExpectations < RuboCop::Cop::Base
  def block_global_expectation?(param0 = nil); end
  def on_send(node); end
  def preferred_receiver(node); end
  def value_global_expectation?(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
end
class RuboCop::Cop::Minitest::LiteralAsActualArgument < RuboCop::Cop::Base
  def autocorrect(corrector, node); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::MultipleAssertions < RuboCop::Cop::Base
  def assertions_count(node); end
  def max_assertions; end
  def on_class(class_node); end
  include RuboCop::Cop::ConfigurableMax
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::NoAssertions < RuboCop::Cop::Base
  def assertions_count(node); end
  def on_class(class_node); end
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::RefuteEmpty < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteFalse < RuboCop::Cop::Base
  def assert_equal_with_false(param0 = nil); end
  def assert_with_bang_argument(param0 = nil); end
  def autocorrect(corrector, node, actual); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteEqual < RuboCop::Cop::Base
  def assert_not_equal(param0 = nil); end
  def on_send(node); end
  def original_usage(first_part, custom_message); end
  def preferred_usage(first_arg, second_arg, custom_message = nil); end
  def process_not_equal(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteInDelta < RuboCop::Cop::Base
  def equal_floats_call(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::InDeltaMixin
end
class RuboCop::Cop::Minitest::RefuteKindOf < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteNil < RuboCop::Cop::Base
  def assertion_type; end
  def nil_refutation(param0 = nil); end
  def on_send(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::ArgumentRangeHelper
  include RuboCop::Cop::Minitest::NilAssertionHandleable
end
class RuboCop::Cop::Minitest::RefuteIncludes < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteMatch < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefuteInstanceOf < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::RefutePathExists < RuboCop::Cop::Base
  def build_good_method(path, message); end
  def on_send(node); end
  def refute_file_exists(param0 = nil); end
  extend RuboCop::Cop::AutoCorrector
end
class RuboCop::Cop::Minitest::RefuteRespondTo < RuboCop::Cop::Base
  def autocorrect(corrector, node, arguments); end
  def correct_receiver(receiver); end
  def enclosed_in_redundant_parentheses?(node); end
  def new_arguments(arguments); end
  def offense_message(arguments); end
  def on_send(node); end
  def peel_redundant_parentheses_from(arguments); end
  extend RuboCop::Cop::AutoCorrector
  extend RuboCop::Cop::MinitestCopRule
  include RuboCop::Cop::ArgumentRangeHelper
end
class RuboCop::Cop::Minitest::TestMethodName < RuboCop::Cop::Base
  def class_elements(class_node); end
  def offense?(node); end
  def on_class(class_node); end
  def public?(node); end
  def test_method_name?(node); end
  extend RuboCop::Cop::AutoCorrector
  include RuboCop::Cop::DefNode
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::UnreachableAssertion < RuboCop::Cop::Base
  def on_block(node); end
  include RuboCop::Cop::MinitestExplorationHelpers
end
class RuboCop::Cop::Minitest::UnspecifiedException < RuboCop::Cop::Base
  def on_block(block_node); end
  def unspecified_exception?(node); end
end
