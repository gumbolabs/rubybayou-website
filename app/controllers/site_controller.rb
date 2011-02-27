class SiteController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=900'
    
    @page_title = "New Orleans Ruby User Group"
    @latest_tweet ||= TwitterCache.get_tweets.first
    
    @latest_event = RMeetup::Client.fetch(:events, {:group_id => "1698508"}).first.event
    @rsvps_collection = RMeetup::Client.fetch(:rsvps, {:event_id => @latest_event["id"]})
  end
end