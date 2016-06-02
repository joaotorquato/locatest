require 'rails_helper'

describe Tweet, '.filter_by' do
  it 'should return only the tweets with @localweb on it' do
    tweets_locaweb = mock_tweets_locaweb
    allow(Tweet).to receive(:request)
      .and_return(mock_tweets_without_locaweb + tweets_locaweb)

    tweets = Tweet.filter_by

    expect(tweets).to eq tweets_locaweb
  end
end
