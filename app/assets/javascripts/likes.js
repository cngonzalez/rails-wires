$(document).ready(function(){
  $("#like_input :submit").on('click', function(e){
    e.preventDefault();
    postLike();
  });
});

function postLike() {
  $.post('likes', $('form').serializeArray()).done(function(data){
    $("#like_container").prepend('<div class="comment-box"><b>Comment by user: </b>' + data['user']['email'] + '<br><p>' + data['comment'] + '</p> <br> </div>')
  });
}
