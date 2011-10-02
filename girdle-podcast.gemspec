# -*- encoding: utf-8 -*-
require File.expand_path('../lib/girdle/podcast/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie Hodge"]
  gem.email         = ["jamiehodge@me.com"]
  gem.description   = %q{Girdle Podcast Producer actions}
  gem.summary       = %q{Create Xgrid tasks for Podcast Producer actions}
  gem.homepage      = ''

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "girdle-podcast"
  gem.require_paths = ['lib/girdle']
  gem.version       = Girdle::Podcast::VERSION
  
  gem.add_dependency('girdle')
end
