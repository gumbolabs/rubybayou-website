module Ramaze
  module Helper
    module PrettyStuff
      def time_ago(time)
        start_date = Time.new
        delta_minutes = (start_date.to_i - time.to_i).floor / 60
        
        case delta_minutes
          when 0..1 then "less than a minute ago"
          when 2..50 then "#{delta_minutes} minutes ago"
          when 51..90 then "about one hour ago"
          when 91..1080 then "#{(delta_minutes / 60).round} hours ago"
          when 1081..1440 then "one day ago"
          when 1441..2879 then "about one day ago"
          else "#{(delta_minutes / 1440).round} days ago"
        end
      end
      
      def linkify_twitter_text(text)
        text = linkify_twitter_users(text)
        text = linkify_twitter_links(text)
        text = linkify_twitter_hashtags(text)
      end
      
      private
      
      def linkify_twitter_users(text)
        text.gsub(/(^|\s)@([a-zA-Z0-9_-]*)(\s|$)/) do |s|
          "#{$1}@<a href=\"http://twitter.com/#{$2}\">#{$2}</a>#{$3}"
        end
      end
      
      def linkify_twitter_links(text)
        text.gsub(/(^|\s)(https?:\/\/[\w\d\:\#\@\%\/;$()~_?\+-=\\\.&]*)(\s|$)/) do |s|
          "#{$1}<a href=\"#{$2}\">#{$2}</a>#{$3}"
        end
      end
      
      def linkify_twitter_hashtags(text)
        text.gsub(/(^|\s)#([a-zA-Z0-9_-]*)(\s|$)/) do |s|
          "#{$1}#<a href=\"http:\/\/twitter.com\/search?q=##{$2}\">#{$2}</a>#{$3}"
        end
      end
    end
  end
end