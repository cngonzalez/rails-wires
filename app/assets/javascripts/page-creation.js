$(document).ready(function() {
  $("#colorpicker-1").spectrum({
    color: "grey",
    move: function(tinycolor) {
      var els = getActiveElements()
      var color = tinycolor.toHexString()
      for (var i = 0; i <  els.length; i++) {
        var element = $(els[i])[0]
        element.style.backgroundColor = color
      }
    }
  });
  $("#colorpicker-2").spectrum({
      color: "grey"
  })
  $("#colorpicker-3").spectrum({
    color: "white"
  })
  $(".cell-contents").on('click', function(e) {
    toggleShape(e)
  })
});

function getActiveElements() {
  var active = []
  $('.cell-contents').each(function(cell) {
    if (this.style.border != "") {
      active.push("#" + this.id)
    }
  })
    return active
}

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


