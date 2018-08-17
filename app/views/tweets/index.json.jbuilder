if @new_tweet.present? # @new_messageに中身があれば
  json.array! @new_tweet do |tweet|
    json.id  tweet.id
    json.text  tweet.text
    json.user_name  tweet.user.username
    json.created_at  tweet.created_at.to_s(:default)
  end
end
