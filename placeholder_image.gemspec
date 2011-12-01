# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'placeholder_image/version'

Gem::Specification.new do |s|
  s.name        = "merchii-placeholder_image"
  s.version     = PlaceholderImage::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jonas Grimfelt", "Merchii"]
  s.email       = ["grimen@gmail.com", "operations@merchii.com"]
  s.homepage    = "https://github.com/merchii/placeholder_image"
  s.summary     = %q{Generate generic placeholder vector images - just like placehold.it, but native.}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_runtime_dependency 'mini_magick'
  s.add_runtime_dependency 'rmagick'
  s.add_runtime_dependency 'commander'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-matchers'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-minitest'
  # s.add_development_dependency 'chunky_png'
end
