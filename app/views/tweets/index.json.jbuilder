if @new_tweet.present? # @new_messageに中身があれば
  json.array! @new_tweet # 配列かつjson形式で@new_messageを返す

end
