$(document).ready(function(){
  $("#like_input").on('submit', function(e){
    e.preventDefault();
    postLike();
  });
});

function postLike() {
  $.post('likes', $('form').serializeArray()).done(function(data){
    debugger;
  });
}
