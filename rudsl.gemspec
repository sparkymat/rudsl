# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rudsl/version'

Gem::Specification.new do |spec|
  spec.name          = "rudsl"
  spec.version       = Rudsl::VERSION
  spec.authors       = ["Ajith Hussain"]
  spec.email         = ["csy0013@googlemail.com"]
  spec.summary       = %q{A functional HTML and CSS dsl in Ruby}
  spec.description   = %q{rudsl provides a function dsl in Ruby, for HTML and CSS.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
