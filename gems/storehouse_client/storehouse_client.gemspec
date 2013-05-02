# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'storehouse_client/version'

Gem::Specification.new do |gem|
  gem.name          = 'storehouse_client'
  gem.version       = StorehouseClient::VERSION
  gem.authors       = ['Jon Gillies']
  gem.email         = ['supercoder@gmail.com']
  gem.description   = %q{This the API client to the Storehouse application.}
  gem.summary       = %q{API client to the Storehouse}
  gem.homepage      = 'https://github.com/jongillies/storehouse'
 
  gem.files = Dir['Rakefile', 'Gemfile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir['{test,spec,features}']

  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'rest-client'
  gem.add_runtime_dependency 'crack'

end
