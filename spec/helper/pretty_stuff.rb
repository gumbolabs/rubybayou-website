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
      expected = /Example @<a href=\"http:\/\/twitter\.com\/username\">username<\/a>/
      
      result = Ramaze::Helper::PrettyStuff.linkify_twitter_text(text)
      result.should.match expected
    end
    
    should "convert http:// links to appropriate links" do
      should.flunk "pending"
    end
    
    should "convert https:// links to appropriate links" do
      should.flunk "pending"
    end
    
    should "convert #hashtags to appropriate links" do
      should.flunk "pending"
    end
  end
end