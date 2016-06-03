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

  it 'should return tweets group by user and ordered by number of tweets' do
    tweets_mrs_brooks_hahn = mock_tweets_mrs_brooks_hahn
    tweets_gerlach_madisen = mock_tweets_gerlach_madisen
    allow(Tweet).to receive(:request)
      .and_return(tweets_gerlach_madisen + tweets_mrs_brooks_hahn)

    tweets = Tweet.filter_by(orderer: :user)

    expect(tweets.first[:user]).to eq 'mrs_brooks_hahn'
    expect(tweets.first[:tweets].count).to eq 3

    expect(tweets.second[:user]).to eq 'gerlach_madisen'
    expect(tweets.second[:tweets].count).to eq 2
  end
end

describe Tweet, '.request' do
  it 'should return an array of tweets' do
    all_tweets = mock_tweets_without_locaweb + mock_tweets_locaweb
    allow(RestClient::Request).to receive(:execute)
      .and_return(File.read('spec/support/fixtures/tweets.json'))

    tweets = Tweet.request

    expect(tweets).to eq all_tweets
  end
end
