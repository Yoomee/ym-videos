class Resource < ActiveRecord::Base
  
  include YmVideos::HasVideo
  
  attr_accessor :video_url, :video_title, :video_description
  
end