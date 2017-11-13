lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pigeon/version"

Gem::Specification.new do |spec|
  spec.name          = "pigeon"
  spec.version       = Pigeon::VERSION
  spec.authors       = ["Stephen Meriwether"]
  spec.email         = ["stephen@meriwether.io"]

  spec.summary       = "A better PubSub to Active Job Integration"
  spec.description   = "A better PubSub to Active Job Integration"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "google-cloud-pubsub"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
