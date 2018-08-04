$("#fav-button").html("#{j(render partial: 'tweets/../partial/favorite', locals: { tweets: @tweets, favs: @favs, fav: @fav})}")
