# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplywallst_snowflake/version'

Gem::Specification.new do |spec|
  spec.name          = "simplywallst_snowflake"
  spec.version       = SimplywallstSnowflake::VERSION
  spec.authors       = ['Brendan Coles']
  spec.email         = ['bcoles@gmail.com']

  spec.summary       = %q{An unofficial client for Simply Wall St Snowflake API.}
  spec.homepage      = 'https://github.com/bcoles/simplywallst_snowflake'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
