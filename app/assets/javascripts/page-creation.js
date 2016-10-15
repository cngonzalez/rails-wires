$(document).ready(function() {
  $(".cell-contents").on('click', function(e) {
    toggleShape(e)
  })
});

function toggleShape(event) {
  var div = event.target
  // debugger;
  if (div.style.border == "") { 
    div.style.border = '2px solid black'
    div.style.borderRadius = '50%'
  }
  else if (div.style.borderRadius == '50%') {
    div.style.borderRadius = ""
  }
  else {div.style.border = ""}
}


