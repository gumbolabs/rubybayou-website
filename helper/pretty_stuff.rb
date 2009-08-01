module Ramaze
  module Helper
    module PrettyStuff
      def time_ago(time)
        start_date = Time.new
        delta_minutes = (start_date.to_i - time.to_i).floor / 60
        
        case
          when delta_minutes < 1
            "less than a minute ago"
          when delta_minutes < 50
            "#{delta_minutes} minutes ago"
          when delta_minutes < 90
            "about one hour ago"
          when delta_minutes < 1080
            "#{(delta_minutes / 60).round} hours ago"
          when delta_minutes < 1440
            "one day ago"
          when delta_minutes < 2880
            "about one day ago"
          else
            "#{(delta_minutes / 1440).round} days ago"
        end  
      end
    end
  end
end