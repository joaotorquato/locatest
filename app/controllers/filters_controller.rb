class FiltersController < ApplicationController
  def index
  end

  def search
    @tweets = Tweet.filter_by
    @tweets_grouped_by_user = Tweet.filter_by(orderer: UserOrder.new)
  end
end
