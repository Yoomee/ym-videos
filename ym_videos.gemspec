$:.push File.expand_path("../lib", __FILE__)

require "ym_videos/version"

Gem::Specification.new do |s|
  s.name        = "ym_videos"
  s.version     = YmVideos::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Si Wilkins", "Edward Andrews", "David Thompson"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "si@yoomee.com", "edward@yoomee.com", "david@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "YmVideos lets you easily add embeddable videos to your Rails site"
  s.description = "YmVideos provides model methods for embedding YouTube and Vimeo videos"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "video_info"

  s.add_development_dependency "sqlite3"
  # s.add_development_dependency "ym_test"
end
