# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'gig'
  s.version     = '0.0.0'
  s.authors     = ['Artem Skripka']
  s.email       = 'therewasadrizzle@gmail.com'
  s.summary     = 'Downloading image of rep owners from search results'
  s.required_ruby_version = '2.5'
  s.files       = Dir['lib/**/*'] + ['bin/gig']
  s.homepage    = 'https://rubygems.org/gems/hola'
  s.license     = 'MIT'
  s.executables << 'gig'
end
