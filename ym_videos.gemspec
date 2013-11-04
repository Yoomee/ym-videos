$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_videos/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_videos"
  s.version     = YmVideos::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Si Wilkins", "Edward Andrews"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "si@yoomee.com", "edward@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "Summary of YmVideos."
  s.description = "Description of YmVideos."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'video_info', "0.4.0"
  s.add_dependency 'ym_core', "~> 1.0"

  # for testing
  s.add_development_dependency "ym_tools", '~> 1.0.0'
  s.add_development_dependency "sqlite3"  
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "listen", '~> 1.3.1'
  s.add_development_dependency "geminabox"
  
end
