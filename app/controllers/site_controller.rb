class SiteController < ApplicationController
  def index
    @page_title = "New Orleans Ruby User Group"
    @tweets ||= TwitterCache.get_tweets
  end
end