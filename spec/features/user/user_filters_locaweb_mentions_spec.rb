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
      expect(page).to have_link "@#{tweet.screen_name}"
      expect(page).to have_link "#{time_ago_in_words(tweet.created_at)} ago"
      expect(page).to have_content tweet.text
      expect(page).to have_content "Number of Retweets: #{tweet.retweet_count}"
      expect(page)
        .to have_content "Number of Followers: #{tweet.followers_count}"
      expect(page)
        .to have_content "Number of Favorites: #{tweet.favorite_count}"
    end

    tweets_without_locaweb.each do |tweet|
      expect(page).not_to have_link "@#{tweet.screen_name}"
      expect(page).not_to have_content tweet.text
    end
  end

  scenario 'ordered based on followers, retweets and favorites' do
    allow(Tweet).to receive(:request)
      .and_return(mock_tweets_without_locaweb + mock_tweets_locaweb)

    visit root_path

    click_on 'Filter Locaweb\'s mentions on twitter'

    within('.tweet_0') do
      expect(page).to have_link '@mrs_brooks_hahn'
      expect(page)
        .to have_link "#{time_ago_in_words('Mon Sep 24 03:35:21 2012')} ago"
      expect(page).to have_content '@locaweb this is a tweet test 2'
      expect(page).to have_content 'Number of Retweets: 10'
      expect(page).to have_content 'Number of Followers: 2000'
      expect(page).to have_content 'Number of Favorites: 7'
    end

    within('.tweet_1') do
      expect(page).to have_link '@gerlach_madisen'
      expect(page)
        .to have_link "#{time_ago_in_words('Mon Sep 24 03:35:21 2012')} ago"
      expect(page).to have_content '@locaweb this is a tweet test 1'
      expect(page).to have_content 'Number of Retweets: 4'
      expect(page).to have_content 'Number of Followers: 1000'
      expect(page).to have_content 'Number of Favorites: 2'
    end
  end
end
