$(document).ready(function() {
  populatePage(); 
})

function populatePage() {
  var pageNum = window.location.href.split('/')[4]
  if (!(pageNum == 'new')) {
   $.get('/pages/' + pageNum + '.json').done(function(data) {
    elLength = data['elements'].length
    for (var i = 0; i < elLength; i++) {
      
    } 
  })
  }
}

