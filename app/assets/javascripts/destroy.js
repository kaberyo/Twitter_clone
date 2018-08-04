$("#fav-button").html("#{j(render partial: 'favorite', locals: { tweets: @tweets, likes: @likes })}");
