class TwitterCache
  include DataMapper::Resource
  
  property :text,         Text
  property :time,         Time, :key => true
  
  def time_ago
    now = Time.new
    
    delta_minutes = (now.to_i - time.to_i).floor / 60
    
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
  
  def self.update_cache
    new_cache = TwitterCache.get_twitter_feed()
    TwitterCache.store_cache(new_cache) unless new_cache.empty?
  end
  
  def self.get_tweets
    TwitterCache.update_cache
    TwitterCache.all(:order => [:time.desc])
  end
  
  private
  
  def self.get_twitter_feed
    feed = []
    
    Twitter::Search.new.from('RubyBayou').per_page(3).each do |tweet|
      feed << tweet
    end
    
    feed
  end
  
  def self.store_cache(cache)
    transaction do |txn|
      TwitterCache.all.destroy!

      cache.each do |tweet|
        attributes = {
          :text => tweet.text,
          :time => DateTime.parse(tweet.created_at).to_time
        }
        
        cached_tweet = TwitterCache.new(attributes)
        cached_tweet.save
      end
    end
  end
end