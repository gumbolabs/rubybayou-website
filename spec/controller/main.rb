require File.expand_path(File.dirname(__FILE__) + '/../common')

include Ramaze::Helper::PrettyStuff

describe MainController do
  before do
    behaves_like :rack_test
  end
  
  describe "home page" do
    should "respond successfully" do
      get('/').status.should == 200
    end
  
    should "include latest blog post" do
      get ('/')
      last_response.should.match /<div.*id=\"latest_blog\".*>.*<\/div>/m
    end
  
    should "include Twitter feed" do
      get ('/')
      last_response.should.match /<div.*id=\"twitter\".*>.*<\/div>/m
    end
    
    it "Twitter feed should include how old the tweets are" do
      get ('/')
      @tweets = TwitterCache.get_tweets
      @tweets.each do |tweet|
        last_response.should.match /<li>#{linkify_twitter_text(Regexp.quote(tweet.text))} <small>\(#{time_ago(tweet.time)}\)<\/small><\/li>/m
      end
    end
  end
end