require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SiteHelper do
  include SiteHelper

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(SiteHelper)
  end

  context "linkify_twitter_text()" do
    it "should respond" do
      self.should.respond_to? :linkify_twitter_text
    end
    
    it "should convert @usernames to appropriate links" do
      text = "Example @username"
      expected = /Example <a href="http:\/\/twitter\.com\/username">@username<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example:@username"
      expected = /Example:<a href="http:\/\/twitter\.com\/username">@username<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "@username: Example"
      expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a>: Example/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example (@username)"
      expected = /Example \(<a href="http:\/\/twitter\.com\/username">@username<\/a>\)/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example [@username]"
      expected = /Example \[<a href="http:\/\/twitter\.com\/username">@username<\/a>\]/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example {@username}"
      expected = /Example \{<a href="http:\/\/twitter\.com\/username">@username<\/a>\}/
      self.linkify_twitter_text(text).should. =~ expected
    end
    
    it "should convert links appropriately" do
      text = "Example http://rubybayou.com"
      expected = /Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a>/
      self.linkify_twitter_text(text).should =~ expected
   
      text = "Example https://rubybayou.com"
      expected = /Example <a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example (https://rubybayou.com)"
      expected = /Example \(<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\)/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example [https://rubybayou.com]"
      expected = /Example \[<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\]/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example {https://rubybayou.com}"
      expected = /Example \{<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\}/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example:https://rubybayou.com"
      expected = /Example:<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example;https://rubybayou.com"
      expected = /Example;<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      self.linkify_twitter_text(text).should =~ expected
   
      text = "Example-https://rubybayou.com"
      expected = /Example-<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
      self.linkify_twitter_text(text).should =~ expected
    end
    
    it "should convert #hashtags to appropriate links" do
      text = "Example #hashtag"
      expected = /Example <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example:#hashtag"
      expected = /Example:<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "#hashtag: Example"
      expected = /<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>: Example/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example (#hashtag)"
      expected = /Example \(<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\)/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example [#hashtag]"
      expected = /Example \[<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\]/
      self.linkify_twitter_text(text).should =~ expected
       
      text = "Example {#hashtag}"
      expected = /Example \{<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\}/
      self.linkify_twitter_text(text).should =~ expected
    end
    
    it "should deal with @usernames, links and #hashtags together" do
      text = "@username Example http://rubybayou.com #hashtag"
      expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a> Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a> <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
      self.linkify_twitter_text(text).should =~ expected
     end
  end
end
