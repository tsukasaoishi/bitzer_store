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

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
