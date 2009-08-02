require File.expand_path(File.dirname(__FILE__) + '/../common')

describe Ramaze::Helper::PrettyStuff do
  describe "time_ago()" do
    should "respond" do
      Ramaze::Helper::PrettyStuff.should.respond_to? :time_ago
    end
  
    should "return friendly estimate of time since a given time" do
      past_time = Time.new
    
      guidelines = {
        "less than a minute ago" => past_time - 30,
        "49 minutes ago" => past_time - (60 * 49),
        "about one hour ago" => past_time - (60 * 89),
        "17 hours ago" => past_time - (60 * 1079),
        "one day ago" => past_time - (60 * 1439),
        "about one day ago" => past_time - (60 * 2879),
        "2 days ago" => past_time - (60 * 2880)
      }

      guidelines.each do |estimate, time|
        Ramaze::Helper::PrettyStuff.time_ago(time).should.be.kind_of? String
        Ramaze::Helper::PrettyStuff.time_ago(time).should.eql? estimate
      end
    end
  end
  
  describe "linkify_twitter_text()" do
    should "respond" do
      Ramaze::Helper::PrettyStuff.should.respond_to? :linkify_twitter_text
    end
    
    should "convert @usernames to appropriate links" do
      text = "Example @username"
      expected = /Example <a href="http:\/\/twitter\.com\/username">@username<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example:@username"
      expected = /Example:<a href="http:\/\/twitter\.com\/username">@username<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "@username: Example"
      expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a>: Example/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example (@username)"
      expected = /Example \(<a href="http:\/\/twitter\.com\/username">@username<\/a>\)/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example [@username]"
      expected = /Example \[<a href="http:\/\/twitter\.com\/username">@username<\/a>\]/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example {@username}"
      expected = /Example \{<a href="http:\/\/twitter\.com\/username">@username<\/a>\}/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
    end
    
    should "convert links appropriately" do
      text = "Example http://rubybayou.com"
      expected = /Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected

      text = "Example https://rubybayou.com"
      expected = /Example <a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example (https://rubybayou.com)"
      expected = /Example \(<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\)/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example [https://rubybayou.com]"
      expected = /Example \[<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\]/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example {https://rubybayou.com}"
      expected = /Example \{<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\}/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example:https://rubybayou.com"
      expected = /Example:<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example;https://rubybayou.com"
      expected = /Example;<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected

      text = "Example-https://rubybayou.com"
      expected = /Example-<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
    end
    
    should "convert #hashtags to appropriate links" do
      text = "Example #hashtag"
      expected = /Example <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example:#hashtag"
      expected = /Example:<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "#hashtag: Example"
      expected = /<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>: Example/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example (#hashtag)"
      expected = /Example \(<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\)/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example [#hashtag]"
      expected = /Example \[<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\]/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
      
      text = "Example {#hashtag}"
      expected = /Example \{<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\}/
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
    end
    
    should "deal with @usernames, links and #hashtags together" do
      text = "@username Example http://rubybayou.com #hashtag"
      expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a> Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a> <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
    end
  end
end