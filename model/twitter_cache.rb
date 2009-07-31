class TwitterCache
  include DataMapper::Resource
  
  property :id,           Serial
  property :text,         Text
  property :date,         DateTime
  
  def self.update_cache
    new_cache = self.get_twitter_feed()
    self.store_cache(new_cache) unless new_cache.empty?
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
          :id => tweet.id,
          :text => tweet.text,
          :date => tweet.created_at
        }
        
        cached_tweet = TwitterCache.new(attributes)
        cached_tweet.save
      end
    end
  end
end