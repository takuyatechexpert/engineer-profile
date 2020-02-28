$(document).on('turbolinks:load', function(){

  function addUser(user) {
    let html = `
    <div class="main__users__list__row">
    <img class="main__users__list__row__image" src= ${user.image}>
    <a class="main__users__list__row__name" href="/users/${user.id}">${user.name}</a>
    </div>
    `;
    $(".main__users__list").append(html);
  }

  function addNoUser() {
    let html = `
    <div class="main__users__list__row">
    <p class="main__users__list__row__notUser" >User not found</p>
    </div>
    `;
    $(".main__users__list").append(html);
  }

  $("#keyword").on("keyup", function(e) {
    e.preventDefault();
    var input = $("#keyword").val();
    $.ajax({
      type: 'GET',
      url: "/profiles",
      data: { keyword: input },
      dataType: 'json',
    })
    .done(function(users) {
      $(".main__users__list").empty();
      if (users.length !== 0) {
        $(".main__users__list").empty();
        users.forEach(function(user){
          addUser(user);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    });
  });
});