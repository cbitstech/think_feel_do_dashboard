$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enrollment_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enrollment_dashboard"
  s.version     = EnrollmentDashboard::VERSION
  s.authors     = ["Michael Wehrley"]
  s.email       = ["michael.wehrley@northwestern.edu"]
  s.homepage    = "https://github.com/michaelwehrley"
  s.summary     = "Summary of EnrollmentDashboard."
  s.description = "Description of EnrollmentDashboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rubocop"

  # for testing
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "poltergeist", "~> 1.5"
  s.add_development_dependency "database_cleaner", "~> 1.3"
  s.add_development_dependency "jasmine-rails", "0.10.0"
end
