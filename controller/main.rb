class MainController < Controller
  def index
    @title = "New Orleans Ruby User Group"
    @tweets ||= TwitterCache.get_tweets
  end
end
