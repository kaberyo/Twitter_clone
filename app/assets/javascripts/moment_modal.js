$(document).on('turbolinks:load', function(){
  $('#momentModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) //モーダルを呼び出すときに使われたボタンを取得
    var title = button.data('title').replace(/\s+/g, ""); //data-whatever の値を取得
    var url = button.data('url') //data-whatever の値を取得
    var modal = $(this)  //モーダルを取得
    modal.find('.modal-body textarea').text("#"+title + " " + url)
  });
});
$(document).on('turbolinks:load', function(){
  $('#modal-submit').on('click', function () {
      console.log("sakurai")
      $('#momentModal').hide();
      $('.modal-backdrop').hide();
  });
});
