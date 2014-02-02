# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/rake/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-rake"
  spec.version       = Rspec::Rake::VERSION
  spec.authors       = ["Stas SUȘCOV"]
  spec.email         = ["stas@net.utcluj.ro"]
  spec.summary       = %q{Test Rake tasks with RSpec.}
  spec.description   = %q{RSpec support for testing Rake tasks.}
  spec.homepage      = "https://github.com/stas/rspec-rake"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"
  spec.add_dependency "rspec-core"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
end
