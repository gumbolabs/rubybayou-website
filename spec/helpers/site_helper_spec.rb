require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SiteHelper do

  #Delete this example and add some real ones or delete this file
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(SiteHelper)
  end

  # describe "linkify_twitter_text()" do
  #   should "respond" do
  #     Ramaze::Helper::PrettyStuff.should.respond_to? :linkify_twitter_text
  #   end
  #   
  #   should "convert @usernames to appropriate links" do
  #     text = "Example @username"
  #     expected = /Example <a href="http:\/\/twitter\.com\/username">@username<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example:@username"
  #     expected = /Example:<a href="http:\/\/twitter\.com\/username">@username<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "@username: Example"
  #     expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a>: Example/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example (@username)"
  #     expected = /Example \(<a href="http:\/\/twitter\.com\/username">@username<\/a>\)/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example [@username]"
  #     expected = /Example \[<a href="http:\/\/twitter\.com\/username">@username<\/a>\]/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example {@username}"
  #     expected = /Example \{<a href="http:\/\/twitter\.com\/username">@username<\/a>\}/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #   end
  #   
  #   should "convert links appropriately" do
  #     text = "Example http://rubybayou.com"
  #     expected = /Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  # 
  #     text = "Example https://rubybayou.com"
  #     expected = /Example <a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example (https://rubybayou.com)"
  #     expected = /Example \(<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\)/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example [https://rubybayou.com]"
  #     expected = /Example \[<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\]/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example {https://rubybayou.com}"
  #     expected = /Example \{<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>\}/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example:https://rubybayou.com"
  #     expected = /Example:<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example;https://rubybayou.com"
  #     expected = /Example;<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  # 
  #     text = "Example-https://rubybayou.com"
  #     expected = /Example-<a href="https:\/\/rubybayou\.com">https:\/\/rubybayou\.com<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #   end
  #   
  #   should "convert #hashtags to appropriate links" do
  #     text = "Example #hashtag"
  #     expected = /Example <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example:#hashtag"
  #     expected = /Example:<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "#hashtag: Example"
  #     expected = /<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>: Example/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example (#hashtag)"
  #     expected = /Example \(<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\)/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example [#hashtag]"
  #     expected = /Example \[<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\]/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #     
  #     text = "Example {#hashtag}"
  #     expected = /Example \{<a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>\}/
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #   end
  #   
  #   should "deal with @usernames, links and #hashtags together" do
  #     text = "@username Example http://rubybayou.com #hashtag"
  #     expected = /<a href="http:\/\/twitter\.com\/username">@username<\/a> Example <a href="http:\/\/rubybayou\.com">http:\/\/rubybayou\.com<\/a> <a href="http:\/\/twitter.com\/search\?q=#hashtag">#hashtag<\/a>/
  #     
  #     result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
  #     result.should.match expected
  #   end
  # end

end