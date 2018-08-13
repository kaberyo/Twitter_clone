$(document).on('turbolinks:load', function() {
  $(function() {
    function appendUser(user){
      var html =`
                  <a href ="/users/${user.id}">
                   <li class="list-group-item">@${user.name}</li>
                  </a>`
      $("#user-search-result").append(html);
              console.log(html)
    }
    function appendNoUser(user){
      var html =`<div class = "user-search-result-box"> ${user} </div>`
      $("#user-search-result").append(html);
    }

    $("#user-search-field").on("keyup", function() {
      var input = $("#user-search-field").val();
      if (input == "") {
        $("#user-search-result").empty();
      }else{
        $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
        })

        .done(function(users) {
        $("#user-search-result").empty();
          if (users.length !== 0) {
             users.forEach(function(user){
             appendUser(user);
            });
          }
          else {
            appendNoUser("一致するユーザーがいません");
          }
        })

        .fail(function() {
          alert('ユーザーの検索に失敗しました');
        });
      }
        return false;
    });
  });
})
