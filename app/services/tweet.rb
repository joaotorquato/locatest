class Tweet
  attr_accessor :text, :screen_name, :followers_count, :retweet_count,
                :favorite_count, :created_at, :user_profile_link, :url, :id

  def self.filter_by
    tweets = request
    tweets.select do |tweet|
      tweet.text.include? '@locaweb'
    end
  end

  def self.request
  end
end
