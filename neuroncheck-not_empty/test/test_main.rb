$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib')
require 'test/unit'
require 'neuroncheck'
require 'neuroncheck/plugin/not_empty'

class BasicTest < Test::Unit::TestCase
  test "usable added keyword (not_empty)" do
    cls = Class.new do
      extend NeuronCheck

      ndecl {
        args not_empty(Array), non_empty(array_of(Integer)), nonempty(String)
      }

      def test_method(ar, int_ar, str)
      end
    end

    inst = cls.new
    assert_nothing_raised{ inst.test_method([1, 2], [3, 4], ' ') }
    assert_raise_message(/must be non-empty Array/){ inst.test_method([], [3, 4], 'a') }
    assert_raise_message(/must be non-empty Array/){ inst.test_method(nil, [3, 4], 'a') }
    assert_raise_message(/must be non-empty array of Integer/){ inst.test_method([1, 2], ['3', '4'], 'a') }
    assert_raise_message(/must be non-empty String/){ inst.test_method([1, 2], [3, 4], '') }
  end
end
