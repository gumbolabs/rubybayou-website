require 'ramaze'
require 'ramaze/spec/bacon'

require __DIR__('../../app')
Ramaze.options.roots = __DIR__('../../')

describe TwitterCache do
  should 'respond to update_cache()' do
    TwitterCache.should.respond_to? :update_cache
  end
  
  should 'have exactly three records after an update_cache()' do
    TwitterCache.update_cache
    TwitterCache.all.size.should.eql? 3
  end
  
  should 'store the id of tweets' do
    TwitterCache.first.should.respond_to? :id
    TwitterCache.first.id.should.not.be.nil?
  end
  
  should 'store the text of tweets' do
    TwitterCache.first.should.respond_to? :text
    TwitterCache.first.text.should.not.be.nil?
  end
  
  should 'store the date of tweets' do
    TwitterCache.first.should.respond_to? :date
    TwitterCache.first.date.should.not.be.nil?
  end
  
  should 'respond to get_tweets()' do
    TwitterCache.should.respond_to? :get_tweets
  end
  
  it 'get_tweets() should return tweets in descending order' do
    @tweets = TwitterCache.get_tweets
    @tweets[0].id.should.be > @tweets[1].id
    @tweets[1].id.should.be > @tweets[2].id
  end
end
