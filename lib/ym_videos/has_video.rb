module YmVideos::HasVideo

  def self.included(base)
    base.send(:attr_accessor, :video_info)
    base.before_validation(:get_video_info)
    base.before_save(:save_video_info)
    base.validate(:found_video_info)    
  end
  
  def has_video?
    video_url.present?
  end
  
  def video_youtube?
    return false if video_url.blank?
    video_url.match(YmVideos::YOUTUBE_REGEX)
  end
  
  def video_vimeo?
    return false if video_url.blank?
    video_url.match(YmVideos::VIMEO_REGEX)
  end
  
  def video_embed_code(options = {})
    src = video_embed_url(options)
    options.reverse_merge!(:width => 640, :height => 390)
    width_height = options.slice(:width, :height).to_param.gsub('&', ' ')    
    if video_vimeo?
      out = "<iframe src='#{src}' #{width_height} frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
    else
      out = "<iframe type='text/html' src='#{src}' #{width_height} frameborder='0'></iframe>"
    end
    out.html_safe
  end
  
  def video_embed_id
    return nil if video_url.blank?
    if res = video_url.match(YmVideos::YOUTUBE_REGEX)
      res[3]
    elsif res = video_url.match(YmVideos::VIMEO_REGEX)
      res[1]
    end
  end
  
  def video_embed_url(options = {})
    if video_youtube?
      "http://www.youtube.com/embed/#{video_embed_id}?autoplay=#{options[:autoplay] ? 1 : 0}"
    elsif video_vimeo?
      "http://player.vimeo.com/video/#{video_embed_id}?title=#{options[:show_title] ? 1 : 0}&amp;byline=0&amp;portrait=0&amp;color=ff9933"
    end
  end
  
  private
  def found_video_info
    if video_info && !video_info.valid?
      errors.add(:video_url, "couldn't find video")
    end
  end
  
  def get_video_info
    if video_url.present? && changed.include?('video_url')
      self.video_url = "http://#{video_url}" unless video_url =~ /^http/
      self.video_info = VideoInfo.new(video_url)
    end
  end
  
  def save_video_info
    if video_info.present?
      self.video_title = video_info.title
      self.video_description = video_info.description
      self.image_url = video_info.thumbnail_large
    end
  end
  
end
YmVideos::YOUTUBE_REGEX = /youtu(.be)?(be.com)?.*(?:\/|v=)([\w-]+)/
YmVideos::VIMEO_REGEX = /.*\.com\/(?:groups\/[^\/]+\/videos\/)?([0-9]+).*$/i