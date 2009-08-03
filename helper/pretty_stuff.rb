module Ramaze
  module Helper
    module PrettyStuff
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
    end
  end
end