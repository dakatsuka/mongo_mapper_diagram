# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_mapper_diagram/version'

Gem::Specification.new do |spec|
  spec.name          = "mongo_mapper_diagram"
  spec.version       = MongoMapperDiagram::VERSION
  spec.authors       = ["Dai Akatsuka"]
  spec.email         = ["d.akatsuka@gmail.com"]
  spec.summary       = %q{Diagram generator for MongoMapper}
  spec.description   = %q{DIagram generator for MongoMapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mongo_mapper"
  spec.add_dependency "gviz"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
