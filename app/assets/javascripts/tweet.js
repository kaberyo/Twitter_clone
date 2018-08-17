$(function(){
  function buildMESSAGE(tweet) {
     var tweets = $('#tweet_body').prepend(`
<a href = "#" class="wrapper card my-2 tweet-color tweet_original" data-id="${tweet.id}" >${ tweet.text }</a>

     `)
  }
  $(function(){
    setInterval(update, 1000);
    //10000ミリ秒ごとにupdateという関数を実行する
  });
  function update(){ //この関数では以下のことを行う
    if($('.tweet_original')[0]){ //もし'tweets'というクラスがあったら
    var tweet_id = $('.tweet_original').first().data('id'); //一番最後にある'tweet_original'というクラスの'id'というデータ属性を取得し、'tweet_id'という変数に代入
    }else{//ない場合は
      var tweet_id = 0 //0を代入
    }
    console.log(tweet_id)
    $.ajax({ //ajax通信で以下のことを行う
      url: location.href, //urlは現在のページを指定
      type: 'GET', //メソッドを指定
      data: { //railsに引き渡すデータは
        tweet: { id: tweet_id } //このような形(paramsの形をしています)で、'id'には'tweet_id'を入れる
      },
      dataType: 'json' //データはjson形式
    })
    .always(function(data){ //通信したら、成功しようがしまいが受け取ったデータ（@new_tweet)を引数にとって以下のことを行う
      $.each(data, function(i, data){ //'data'を'data'に代入してeachで回す
        buildMESSAGE(data); //buildMESSAGEを呼び出す
      });
    });
  }
});
