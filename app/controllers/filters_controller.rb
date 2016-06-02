class FiltersController < ApplicationController
  def index
  end

  def search
    @tweets = Tweet.filter_by
  end
end
