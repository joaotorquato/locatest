class UserOrder
  def order(tweets)
    group = tweets.group_by(&:screen_name)
    users = []
    group.each do |t|
      users << { user: t.shift, tweets: DefaultOrder.new.order(t.shift) }
    end
    users.sort_by do |t|
      - t[:tweets].count
    end
  end
end
