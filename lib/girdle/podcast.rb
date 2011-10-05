require 'bundler/setup'
require 'girdle'

require_relative 'podcast/version'
require_relative 'podcast/action'
require_relative 'podcast/composition'

Girdle::Task.extend(Girdle::Podcast::Action)
Girdle::Task.extend(Girdle::Podcast::Composition)