$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pre_render/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pre_render"
  s.version     = PreRender::VERSION
  s.authors     = ["Nathan Brazil"]
  s.email       = ["nb@bitaxis.com"]
  s.homepage    = "https://github.com/bitaxis/pre_render"
  s.summary     = "Adds support for a pre_render() method to Rails controllers."
  s.description = "If defined, a Rails controller's pre_prender() method will be invoked for each action right before Rail's built-in render() method.  This will give the controller a chance to fully initialize any variables or view model just prior to rendering the view."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
