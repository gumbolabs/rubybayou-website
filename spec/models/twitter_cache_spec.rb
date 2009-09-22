require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TwitterCache do
  before(:each) do
    TwitterCache.update_cache
  end
  
  it "should store the text of tweets" do
    TwitterCache.first.should respond_to(:text)
    TwitterCache.first.text.should_not be_nil
    TwitterCache.first.text.should be_a_kind_of(String)
  end
  
  it "should store the time of tweets as datetime" do
    TwitterCache.first.should respond_to(:datetime)
    TwitterCache.first.datetime.should_not be_nil
    # TwitterCache.first.datetime.should be_a_kind_of DateTime
  end
  
  describe "self.update_cache()" do
    it "should respond" do
      TwitterCache.should respond_to(:update_cache)
    end
  
    it "should have exactly three records after call" do
      TwitterCache.update_cache
      TwitterCache.all.size.should == 3
    end
  end
  
  describe "self.get_tweets()" do
    it "should respond" do
      TwitterCache.should respond_to(:get_tweets)
    end
  
    it "should return an array of tweets" do
      TwitterCache.get_tweets.should be_an_instance_of(Array)
    end
  
    it "should return exactly 3 tweets" do
      TwitterCache.get_tweets.size.should.eql? 3
    end
  
    it "should return tweets in descending order" do
      @tweets = TwitterCache.get_tweets
      @tweets[0].datetime.should > @tweets[1].datetime
      @tweets[1].datetime.should > @tweets[2].datetime
    end
  end
end
