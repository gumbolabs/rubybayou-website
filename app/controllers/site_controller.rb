class SiteController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=900'
    
    @page_title = "New Orleans Ruby User Group"
    @tweets ||= TwitterCache.get_tweets
  end
end