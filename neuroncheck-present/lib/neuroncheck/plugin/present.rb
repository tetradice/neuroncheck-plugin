require 'neuroncheck'
require 'active_support'
require 'active_support/core_ext'

NeuronCheckSystem::Plugin.add_keyword(:present) do
	def on_call(child_target = nil)
		@child_target = child_target
	end

	def match?(value)
		if @child_target.nil? then
			value.present?
		else
			@api.expected_value_match?(value, @child_target) and value.present?
		end
	end

	def expected_caption
		if @child_target.nil? then
			"any present object"
		else
			"present #{@api.get_expected_value_caption(@child_target)}"
		end
	end

	def expected_short_caption
		if @child_target.nil? then
			"present object"
		else
			"present #{@api.get_expected_value_caption(@child_target)}"
		end
	end
end
