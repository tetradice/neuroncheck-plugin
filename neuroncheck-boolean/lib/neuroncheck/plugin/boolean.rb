require 'neuroncheck'

NeuronCheckSystem::Plugin.add_keyword(:boolean) do
	def on_call
	end

	def match?(value)
		value.equal?(true) or value.equal?(false)
	end

	def expected_caption
		"boolean value"
	end

	def expected_short_caption
		"boolean"
	end
end
