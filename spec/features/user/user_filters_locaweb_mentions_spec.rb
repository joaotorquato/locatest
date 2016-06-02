require 'rails_helper'

feature 'User filters locaweb\'s mentions on twitter' do
  scenario 'successfuly' do
    tweets_without_locaweb = mock_tweets_without_locaweb
    tweets_locaweb = mock_tweets_locaweb
    allow(Tweet)
      .to receive(:request).and_return(tweets_without_locaweb + tweets_locaweb)

    visit root_path

    click_on 'Filter Locaweb\'s mentions on twitter'

    tweets_locaweb.each do |tweet|
      expect(page).to have_link tweet.screen_name
      expect(page).to have_link "#{time_ago_in_words(tweet.created_at)} ago"
      expect(page).to have_content tweet.text
      expect(page).to have_content "Number of Retweets: #{tweet.retweet_count}"
      expect(page)
        .to have_content "Number of Followers: #{tweet.followers_count}"
      expect(page)
        .to have_content "Number of Favorites: #{tweet.favorite_count}"
    end

    tweets_without_locaweb.each do |tweet|
      expect(page).not_to have_link tweet.screen_name
      expect(page).not_to have_content tweet.text
    end
  end
end
