$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib')
require 'test/unit'
require 'neuroncheck'
require 'neuroncheck/plugin/present'

class BasicTest < Test::Unit::TestCase
  test "usable added keyword (present)" do
    cls = Class.new do
      extend NeuronCheck

      ndecl {
        args present, present(String)
      }

      def test_method(pres, pres_str)
      end
    end

    inst = cls.new
    assert_nothing_raised{ inst.test_method(1, 'a') }
    assert_nothing_raised{ inst.test_method('b', 'a')}
    assert_raise_message(/must be any present object/){ inst.test_method('', 'a') }
    assert_raise_message(/must be present String/){ inst.test_method(1, '') }
    assert_raise_message(/must be present String/){ inst.test_method(1, 1) }
  end
end
