module Mocks
  module Tweets
    def mock_tweets_locaweb
      tweets = []
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a tweet test 1',
                                screen_name: 'gerlach_madisen',
                                followers_count: 1000,
                                retweet_count: 4,
                                favorite_count: 2,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/gerlach_madisen',
                                url: 'https://twitter.com/joaotorquato/status/732578265261604865',
                                id: 2)
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a tweet test 2',
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
                                text: '@other_company this is a tweet test 3',
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

    def mock_tweets_mrs_brooks_hahn
      tweets = []
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a mock test 1',
                                screen_name: 'mrs_brooks_hahn',
                                followers_count: 2000,
                                retweet_count: 4,
                                favorite_count: 2,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/mrs_brooks_hahn',
                                url: 'https://twitter.com/joaotorquato/status/732578265261604865',
                                id: 4)
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a mock test 2',
                                screen_name: 'mrs_brooks_hahn',
                                followers_count: 2000,
                                retweet_count: 10,
                                favorite_count: 7,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/mrs_brooks_hahn',
                                url: 'https://twitter.com/denhamsadler/status/716520457168498688',
                                id: 5)
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a mock test 3',
                                screen_name: 'mrs_brooks_hahn',
                                followers_count: 2000,
                                retweet_count: 11,
                                favorite_count: 8,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/mrs_brooks_hahn',
                                url: 'https://twitter.com/denhamsadler/status/716520457168498688',
                                id: 6)
      tweets
    end

    def mock_tweets_gerlach_madisen
      tweets = []
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a super mock test 1',
                                screen_name: 'gerlach_madisen',
                                followers_count: 1000,
                                retweet_count: 3,
                                favorite_count: 1,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/gerlach_madisen',
                                url: 'https://twitter.com/joaotorquato/status/732578265261604865',
                                id: 2)
      tweets << instance_double('Tweet',
                                text: '@locaweb this is a super mock test 2',
                                screen_name: 'gerlach_madisen',
                                followers_count: 1000,
                                retweet_count: 6,
                                favorite_count: 2,
                                created_at: 'Mon Sep 24 03:35:21 +0000 2012',
                                user_profile_link: 'https://twitter.com/gerlach_madisen',
                                url: 'https://twitter.com/denhamsadler/status/716520457168498688',
                                id: 3)
      tweets
    end
  end
end
