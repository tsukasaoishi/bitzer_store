# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitzer_store/version'

Gem::Specification.new do |spec|
  spec.name          = "bitzer_store"
  spec.version       = BitzerStore::VERSION
  spec.authors       = ["Tsukasa OISHI"]
  spec.email         = ["tsukasa.oishi@gmail.com"]

  spec.description   = %q{BitzerStore can treat individual cache clusters in Rails.}
  spec.summary       = %q{BitzerStore can treat individual cache clusters in Rails.}
  spec.homepage      = "https://github.com/tsukasaoishi/bitzer_store"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency "activesupport", ">= 5.0", "< 5.3"
  spec.add_dependency "railties", ">= 5.0", "< 5.3"

  spec.add_development_dependency "bundler", ">= 1.3.0", "< 2.0"
  spec.add_development_dependency "rake", ">= 0.8.7"
  spec.add_development_dependency "rspec", '~> 3.0'
  spec.add_development_dependency 'appraisal'
end
