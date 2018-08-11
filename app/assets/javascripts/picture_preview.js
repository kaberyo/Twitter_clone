$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $(".post_photo").on('change', 'input[type="file"]', function(e) {
    console.log("成功")
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".profileEdit__form__avater__preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "500px",
                  height: "500px",
                  class: "rounded-circle image_trimming",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
