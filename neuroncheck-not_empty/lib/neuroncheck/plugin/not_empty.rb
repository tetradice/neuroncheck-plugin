require 'neuroncheck'

NeuronCheckSystem::Plugin.add_keyword(:not_empty) do
	def on_call(child_target)
		@child_target = child_target
	end

	def match?(value)
		@api.expected_value_match?(value, @child_target) and value.respond_to?(:empty?) and not value.empty?
	end

	def expected_caption
		"non-empty #{@api.get_expected_value_caption(@child_target)}"
	end
end


NeuronCheckSystem::Plugin.alias_keyword(:nonempty, :not_empty)
NeuronCheckSystem::Plugin.alias_keyword(:non_empty, :not_empty)
