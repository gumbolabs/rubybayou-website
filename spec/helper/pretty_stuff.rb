require 'ramaze'
require 'ramaze/spec/bacon'

require __DIR__('../../app')
Ramaze.options.roots = __DIR__('../../')

require __DIR__('../../helper/pretty_stuff')

describe Ramaze::Helper::PrettyStuff do
  should "respond to time_ago()" do
    Ramaze::Helper::PrettyStuff.should.respond_to? :time_ago
  end
  
  it "time_ago() should return friendly estimate of time since a given time" do
    # when delta_minutes < 1
    #   "less than a minute ago"
    # when delta_minutes < 50
    #   "#{delta_minutes} minutes ago"
    # when delta_minutes < 90
    #   "about one hour ago"
    # when delta_minutes < 1080
    #   "#{(delta_minutes / 60).round} hours ago"
    # when delta_minutes < 1440
    #   "one day ago"
    # when delta_minutes < 2880
    #   "about one day ago"
    # else
    #   "#{(delta_minutes / 1440).round} days ago"
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