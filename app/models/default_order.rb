class DefaultOrder
  def order(tweets)
    tweets.sort_by do |t|
      - (t.favorite_count + t.retweet_count + t.followers_count)
    end
  end
end
