class FeedController < ApplicationController

  skip_before_action :authenticate_user!
  
  def index
    # feed_urls = params[:reddit_input_rss] || []
    feed_url_ids_str = params[:reddit_input_rss] || ''
    feed_urls = InputFeed.where(id: feed_url_ids_str.split(','), feed_type: 'reddit').pluck(:url)
    @reddit_entries = Feed.reddit_feed_entries feed_urls

    # feed_urls = params[:google_input_rss] || []
    feed_url_ids_str = params[:google_input_rss] || ''
    feed_urls = InputFeed.where(id: feed_url_ids_str.split(','), feed_type: 'google').pluck(:url)
    @google_entries = Feed.google_feed_entries feed_urls
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def feed_test
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end