class TwitterCache < ActiveRecord::Base
  def self.update_cache
    if self.cache_stale?
      new_cache = TwitterCache.get_twitter_feed()
      TwitterCache.store_cache(new_cache) unless new_cache.empty?
    end
  end
  
  def self.get_tweets
    TwitterCache.update_cache
    TwitterCache.all(:order => 'datetime DESC')
  end
  
  private
  
  def self.cache_stale?
    tweet = TwitterCache.first
    
    return true if tweet.nil?
    
    unless tweet.datetime < (DateTime.now - 3600)
      tweet.text != Twitter::Search.new.from('RubyBayou').per_page(1).fetch().results[0].text
    end
  end
  
  def self.get_twitter_feed
    feed = []
    
    Twitter::Search.new.from('RubyBayou').per_page(3).each do |tweet|
      feed << tweet
    end
    
    feed
  end
  
  def self.store_cache(cache)
    ActiveRecord::Base.transaction do |txn|
      TwitterCache.destroy_all

      cache.each do |tweet|
        attributes = {
          :text => tweet.text,
          :datetime => DateTime.parse(tweet.created_at)
        }
        
        cached_tweet = TwitterCache.new(attributes)
        cached_tweet.save
      end
    end
  end
end