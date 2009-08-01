require File.expand_path(File.dirname(__FILE__) + '/../common')

describe Ramaze::Helper::PrettyStuff do
  should "respond to time_ago()" do
    Ramaze::Helper::PrettyStuff.should.respond_to? :time_ago
  end
  
  it "time_ago() should return friendly estimate of time since a given time" do
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
      Ramaze::Helper::PrettyStuff.time_ago(time).should.eql? estimate
    end
  end
end