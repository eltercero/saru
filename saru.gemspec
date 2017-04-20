# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saru/version'

Gem::Specification.new do |spec|
  spec.name          = "saru"
  spec.version       = Saru::VERSION
  spec.authors       = ["Victor"]
  spec.email         = ["victor.martin84@gmail.com"]

  spec.summary       = %q{Wanikani items API Wrapper.}
  spec.description   = %q{Wanikani API Wrapper for the user's items (radicals, kanji and vocabulary)}
  spec.homepage      = "https://github.com/eltercero/saru"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "faraday", '~>0.9'
  spec.add_development_dependency "json", '~>1.8'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
