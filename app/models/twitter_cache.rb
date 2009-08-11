class TwitterCache < ActiveRecord::Base
  def self.update_cache
    new_cache = self.get_twitter_feed()
    self.store_cache(new_cache) unless new_cache.empty?
  end
  
  def self.get_tweets
    self.update_cache
    self.all(:order => 'datetime DESC')
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
    ActiveRecord::Base.transaction do
      self.destroy_all

      cache.each do |tweet|
        attributes = {
          :text => tweet.text,
          :datetime => DateTime.parse(tweet.created_at)
        }
        
        cached_tweet = self.new(attributes)
        cached_tweet.save
      end
    end
  end
end