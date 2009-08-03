require File.expand_path(File.dirname(__FILE__) + '/../common')

describe TwitterCache do
  should 'store the text of tweets' do
    TwitterCache.first.should.respond_to? :text
    TwitterCache.first.text.should.not.be.nil?
    TwitterCache.first.text.should.be.kind_of? String
  end
  
  should 'store the time of tweets' do
    TwitterCache.first.should.respond_to? :time
    TwitterCache.first.time.should.not.be.nil?
    TwitterCache.first.time.should.be.kind_of? Time
  end
  
  describe "time_ago()" do
    should "respond" do
      TwitterCache.first.should.respond_to? :time_ago
    end
  end
  
  describe "self.update_cache()" do
    should "respond" do
      TwitterCache.should.respond_to? :update_cache
    end
  
    should "after call there should be exactly three records" do
      TwitterCache.update_cache
      TwitterCache.all.size.should.eql? 3
    end
  end
  
  describe "self.get_tweets()" do
    should "respond" do
      TwitterCache.should.respond_to? :get_tweets
    end
  
    should "return an array of tweets" do
      TwitterCache.get_tweets.should.be.kind_of? Array
    end
  
    should "return exactly 3 tweets" do
      TwitterCache.get_tweets.size.should.eql? 3
    end
  
    should "return tweets in descending order" do
      @tweets = TwitterCache.get_tweets
      @tweets[0].time.should.be > @tweets[1].time
      @tweets[1].time.should.be > @tweets[2].time
    end
  end
end