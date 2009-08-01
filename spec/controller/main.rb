require __DIR__('../common')

require __DIR__('../../helper/pretty_stuff')
include Ramaze::Helper::PrettyStuff

describe MainController do
  behaves_like :rack_test

  it 'home page should respond successfully' do
    get('/').status.should == 200
  end
  
  it 'home page should include latest blog post' do
    get ('/')
    last_response.should.match /<div.*id=\"latest_blog\".*>.*<\/div>/m
  end
  
  it 'home page should include Twitter feed' do
    get ('/')
    last_response.should.match /<div.*id=\"twitter\".*>.*<\/div>/m
  end
  
  it "home page Twitter feed should include how old the tweets are" do
    @tweets = TwitterCache.get_tweets
    @tweets.each do |tweet|
      last_response.should.match /<li>#{Regexp.quote(tweet.text)} <small>\(#{time_ago(tweet.time)}\)<\/small><\/li>/m
    end
  end
end
