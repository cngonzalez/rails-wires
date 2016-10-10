function getPages() {
  $.get('/pages/all').success(function(data) {
      for(var i = 0; i < data.length; i++){
      $("#page-container").append('<div class="index-box"> <h3> <a href= /pages/' + data[i]['id'] + '>' + data[i]['name'] + '</a></h3><p>Created by <a href= /users/' + data[i]['user']['id'] + '>' + data[i]['user']['email'] + '</a></p></div>');
    };
  });
}

$(document).ready(function(){
  getPages();
});
