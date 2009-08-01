class TwitterCache
  include DataMapper::Resource
  
  property :text,         Text
  property :date,         DateTime, :key => true
  
  def time
    self.date.to_time
  end
  
  def self.update_cache
    new_cache = TwitterCache.get_twitter_feed()
    TwitterCache.store_cache(new_cache) unless new_cache.empty?
  end
  
  def self.get_tweets
    TwitterCache.update_cache
    TwitterCache.all(:order => [:date.desc])
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
          :date => tweet.created_at
        }
        
        cached_tweet = TwitterCache.new(attributes)
        cached_tweet.save
      end
    end
  end
end