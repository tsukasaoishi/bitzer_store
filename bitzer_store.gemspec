# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitzer_store/version'

Gem::Specification.new do |spec|
  spec.name          = "bitzer_store"
  spec.version       = BitzerStore::VERSION
  spec.authors       = ["tsukasaoishi"]
  spec.email         = ["tsukasa.oishi@gmail.com"]
  spec.description   = %q{BitzerStore can treat individual cache clusters in Rails.}
  spec.summary       = %q{BitzerStore can treat individual cache clusters in Rails.}
  spec.homepage      = "https://github.com/tsukasaoishi/bitzer_store"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.2", "< 4.2"
  spec.add_dependency "railties", ">= 3.2", "< 4.2"

  spec.add_development_dependency "bundler", '~> 1.6.2'
  spec.add_development_dependency "rake", '~> 10.3.2'
  spec.add_development_dependency "rspec", '~> 3.0.0'
end
