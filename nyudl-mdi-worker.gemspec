# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyudl/mdi/worker/version'

Gem::Specification.new do |spec|
  spec.name          = "nyudl-mdi-worker"
  spec.version       = Nyudl::Mdi::Worker::VERSION
  spec.authors       = ["jgpawletko"]
  spec.email         = ["jgpawletko@gmail.com"]

  spec.summary       = %q{Worker gem for a Message Driven Infrastructure}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/jgpawletko/nyudl-mdi-worker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",  "~> 1.8"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "rspec",    "~> 3.2"
  spec.add_development_dependency "cucumber", "~> 1.3"
end
