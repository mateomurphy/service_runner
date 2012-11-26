# -*- encoding: utf-8 -*-
require File.expand_path('../lib/service_runner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mateo Murphy"]
  gem.email         = ["mateo.murphy@gmail.com"]
  gem.description   = %q{Service runner for rails}
  gem.summary       = %q{Easily manage services for your rails app}
  gem.homepage      = "https://github.com/mateomurphy/service_runner"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "service_runner"
  gem.require_paths = ["lib"]
  gem.version       = ServiceRunner::VERSION
end
