# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'machina/version'

Gem::Specification.new do |spec|
  spec.name          = "machina"
  spec.version       = Machina::VERSION
  spec.authors       = ["Ricardo Diaz"]
  spec.email         = ["ricardotk002@gmail.com"]

  spec.summary       = %q{"Rebuilding Rails"}
  spec.description   = %q{"This is a rebuild of the RoR framework"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "rack", "~> 1.6"
  spec.add_runtime_dependency "erubis", "~> 2.7"
  spec.add_runtime_dependency "multi_json", "~> 1.11"

end
