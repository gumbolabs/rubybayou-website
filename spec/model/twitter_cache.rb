require File.expand_path(File.dirname(__FILE__) + '/../common')

describe TwitterCache do
  should 'store the text of tweets' do
    TwitterCache.first.should.respond_to? :text
    TwitterCache.first.text.should.not.be.nil?
    TwitterCache.first.text.should.be.kind_of? String
  end
  
  should 'store the date of tweets' do
    TwitterCache.first.should.respond_to? :date
    TwitterCache.first.date.should.not.be.nil?
    TwitterCache.first.date.should.be.kind_of? DateTime
  end
  
  describe "time()" do
    should "respond" do
      TwitterCache.first.should.respond_to? :time
    end
  
    should "return a Time object" do
      TwitterCache.first.time.should.be.kind_of? Time
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
      @tweets[0].date.should.be > @tweets[1].date
      @tweets[1].date.should.be > @tweets[2].date
    end
  end
end