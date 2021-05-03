# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'gig'
  s.version     = '0.0.1'
  s.authors     = ['Artem Skripka']
  s.email       = 'therewasadrizzle@gmail.com'
  s.summary     = 'Downloading image of rep owners from search results'
  s.required_ruby_version = '>=2.6'
  s.files       = `git ls-files -- lib/*`.split("\n")
  s.homepage    = 'https://example.com'
  s.license     = 'MIT'
  s.bindir      = 'bin'
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
end
