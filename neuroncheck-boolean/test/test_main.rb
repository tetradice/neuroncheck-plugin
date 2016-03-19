$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib')
require 'test/unit'
require 'neuroncheck'
require 'neuroncheck/plugin/boolean'

class BasicTest < Test::Unit::TestCase
  test "usable added keyword (boolean)" do
    cls = Class.new do
      extend NeuronCheck

      ndecl {
        args boolean
      }

      def test_method(flag = false)
      end
    end

    inst = cls.new
    assert_nothing_raised{ inst.test_method }
    assert_nothing_raised{ inst.test_method(false) }
    assert_nothing_raised{ inst.test_method(true) }
    assert_raise_message(/must be boolean value/){ inst.test_method('1') }

    p NeuronCheck.get_declarations_as_json
  end
end
