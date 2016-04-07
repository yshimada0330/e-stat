# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'e-stat/version'

Gem::Specification.new do |spec|
  spec.name          = "e-stat"
  spec.version       = EStat::VERSION
  spec.authors       = ["shimada227"]
  spec.email         = ["yoshihiro.shimada@coconala.com"]

  spec.summary       = %q{A Ruby wrapper for the e-Stat API}
  spec.description   = %q{A Ruby wrapper for the e-Stat API}
  spec.homepage      = "https://github.com/yshimada0330/e-stat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", [">= 0.7", "< 0.10"]
  spec.add_runtime_dependency "faraday_middleware", "~> 0.8"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
end
