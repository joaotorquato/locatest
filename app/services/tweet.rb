class Tweet
  attr_accessor :text, :screen_name, :followers_count, :retweet_count,
                :favorite_count, :created_at, :user_profile_link, :url, :id

  def initialize(hash)
    @screen_name = hash['user']['screen_name']
    @text = hash['text']
    @followers_count = hash['user']['followers_count'].to_i
    @retweet_count = hash['retweet_count'].to_i
    @favorite_count = hash['user']['favourites_count'].to_i
    @created_at = hash['created_at']
    @user_profile_link = hash['user']['url']
    @url = hash['entities']['urls'].first
    @id = hash['id'].to_i
  end

  def self.filter_by(orderer: :default)
    tweets = request.select do |tweet|
      tweet.text.include? '@locaweb'
    end
    if orderer == :default
      tweets.sort_by do |t|
        - (t.favorite_count + t.retweet_count + t.followers_count)
      end
    elsif orderer == :user
      group = tweets.group_by(&:screen_name)
      users = []
      group.each do |t|
        users << { user: t.shift, tweets: t.shift }
      end
      users.sort_by do |t|
        - t[:tweets].count
      end
    end
  end

  def self.request
    json = RestClient::Request
           .execute(method: :get, url: 'http://tweeps.locaweb.com.br/',
                    timeout: 10, headers: { Username: 'joao.otl@gmail.com' })
    data_hash = JSON.parse(json)
    tweets = []
    data_hash['statuses'].each do |tweet|
      tweets << Tweet.new(tweet)
    end
    tweets
  end

  def ==(other)
    return false unless other.id == id
    true
  end
end
