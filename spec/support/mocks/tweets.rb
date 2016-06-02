module Mocks
  module Tweets
    def mock_tweets_locaweb
      tweets = []
      tweets << instance_double('Tweet',
                                text: '@locaweb I\'ll back up the mobile HDD application, that should driver the HDD application!',
                                screen_name: 'gerlach_madisen',
                                followers_count: 1000,
                                retweet_count: 4,
                                favorite_count: 2,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/gerlach_madisen',
                                url: 'https://twitter.com/joaotorquato/status/732578265261604865',
                                id: 2)
      tweets << instance_double('Tweet',
                                text: '@locaweb calculating the card won\'t do anything, we need to quantify the neural SQL pixel!',
                                screen_name: 'mrs_brooks_hahn',
                                followers_count: 2000,
                                retweet_count: 10,
                                favorite_count: 7,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/mrs_brooks_hahn',
                                url: 'https://twitter.com/denhamsadler/status/716520457168498688',
                                id: 3)
      tweets
    end

    def mock_tweets_without_locaweb
      tweets = []
      tweets << instance_double('Tweet',
                                text: '@dexter_jacobs If we synthesize the array, we can get to the SDD transmitter through the virtua',
                                screen_name: 'lauriane_dibbert',
                                followers_count: 1231,
                                retweet_count: 1,
                                favorite_count: 1,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/lauriane_dibbert',
                                url: 'https://twitter.com/joaotorquato/status/733362298316828672',
                                id: 1)
      tweets
    end
  end
end
