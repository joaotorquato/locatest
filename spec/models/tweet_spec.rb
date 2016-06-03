require 'rails_helper'

describe Tweet, '.filter_by' do
  it 'should return only the tweets with @localweb on it' do
    tweets_locaweb = mock_tweets_locaweb
    allow(Tweet).to receive(:request)
      .and_return(mock_tweets_without_locaweb + tweets_locaweb)

    tweets = Tweet.filter_by

    tweets.each do |tweet|
      expect(tweets_locaweb.include?(tweet)).to be true
    end
  end

  it 'should order based on followers, retweets and favorites' do
    tweets_locaweb = mock_tweets_locaweb
    allow(Tweet).to receive(:request)
      .and_return(mock_tweets_without_locaweb + tweets_locaweb)

    tweets = Tweet.filter_by

    expect(tweets.first.screen_name).to eq 'mrs_brooks_hahn'
    expect(tweets.second.screen_name).to eq 'gerlach_madisen'
  end
end
