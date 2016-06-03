class Tweet
  attr_accessor :text, :screen_name, :followers_count, :retweet_count,
                :favorite_count, :created_at, :user_profile_link, :url, :id

  def self.filter_by
    tweets = request.select do |tweet|
      tweet.text.include? '@locaweb'
    end
    tweets.sort_by do |t|
      - (t.favorite_count + t.retweet_count + t.followers_count)
    end
  end

  def self.request
  end
end
