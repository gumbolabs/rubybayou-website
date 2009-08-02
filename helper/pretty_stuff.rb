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
    end
  end
end