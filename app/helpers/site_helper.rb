module SiteHelper
  def linkify_twitter_text(text)
    text = linkify_twitter_users(text)
    text = linkify_twitter_links(text)
    text = linkify_twitter_hashtags(text)
  end
  
  private
  
  def linkify_twitter_users(text)
    text.gsub(/(\A|[\s\(\[\{:;\-,\.])@([\w\-]*)([\s\)\]\}:;,\.]|\Z)/) do |s|
      "#{$1}<a href=\"http://twitter.com/#{$2}\">@#{$2}</a>#{$3}"
    end
  end
  
  def linkify_twitter_links(text)
    text.gsub(/(\A|[\s\(\[\{:;\-,\.])(https?:\/\/[\w\d\:\#\@\%\/;$~?\+-=\\\.&]*)([\s\)\]\}]|\Z)/) do |s|
      "#{$1}<a href=\"#{$2}\">#{$2}</a>#{$3}"
    end
  end
  
  def linkify_twitter_hashtags(text)
    text.gsub(/(\A|[\s\(\[\{:;\-,\.])#([\w\-]*)([\s\)\]\}:;,\.]|\Z)/) do |s|
      "#{$1}<a href=\"http:\/\/twitter.com\/search?q=##{$2}\">##{$2}</a>#{$3}"
    end
  end
  
  def get_member_photo(rsvp_info)
    return "/images/sample_photo.jpg" if rsvp_info["photo_url"].blank? 
    rsvp_info["photo_url"].gsub("member_", "thumb_")
  end
  
  def get_date(time)
    Time.at(time / 1000).strftime("%B %e, %Y")
	end
	
	def get_time(time)
	  start_time = Time.at(time / 1000)
    end_time = Time.at((time / 1000) + 2.hours)
	  "#{start_time.strftime("%l:%M%P")} - #{end_time.strftime("%l:%M%P")}"
	end
end