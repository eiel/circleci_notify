# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circleci_notify/version'

Gem::Specification.new do |spec|
  spec.name          = "circleci_notify"
  spec.version       = CircleciNotify::VERSION
  spec.authors       = ["Tomohiko Himura"]
  spec.email         = ["eiel.hal@gmail.com"]
  spec.summary       = %q{Notification when finished Build on CircleCI}
  spec.description   = %q{Notification when finished Build on CircleCI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "chatwork", "~> 0.0.5"
end
