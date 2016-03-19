# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "neuroncheck-boolean"
  spec.version       = '0.1.0'
  spec.authors       = ["Dice"]
  spec.email         = ["tetradice@gmail.com"]

  spec.summary       = %q{Plugin for NeuronCheck - add "boolean" keyword.}
  spec.description   = %q{Plugin for NeuronCheck - add "boolean" keyword.}
  spec.homepage      = "http://ruby.morphball.net/neuroncheck/"
  spec.license       = "MIT"

  spec.files         = Dir.glob('{lib}/**/*.rb') + ['Rakefile.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'neuroncheck'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
end
