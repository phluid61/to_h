Gem::Specification.new do |gem|
  gem.name          = 'to_h'
  gem.version       = '0.0.1'
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.summary       = 'Add SomePairs#to_h for compatbility with Ruby 2.0+'
  gem.description   = gem.summary.dup
  gem.homepage      = 'http://kachick.github.com/to_h/'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.8.7'

  gem.add_development_dependency 'yard', '>= 0.8.5.2', '< 2'
  gem.add_development_dependency 'rake', '>= 10', '< 20'
  gem.add_development_dependency 'bundler', '>= 1.3.0', '< 2'
end