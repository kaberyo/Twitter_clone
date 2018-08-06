$("#fav-button").html("#{j(render partial: 'partial/favorite', locals: { tweets: @tweets, favs: @favs, fav: @fav})}")
