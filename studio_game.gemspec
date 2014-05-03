
Gem::Specification.new do |s|
  s.name         = "studio_game_paulhaddad"
  s.version      = "1.0.0"
  s.author       = "Paul Haddad"
  s.email        = "paulh16@gmail.com"
  s.summary      = "Studio game for Pragmatic Studio Ruby Course"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
end
