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
  if (div.style.border == "") { 
    div.style.border = '2px solid black'
    div.style.borderRadius = '50%'
    div.style.backgroundColor = $('#colorpicker-1').spectrum('get').toHexString()
  }
  else if (div.style.borderRadius == '50%') {
    div.style.borderRadius = ""
    div.style.backgroundColor = $('#colorpicker-1').spectrum('get').toHexString()
  }
  else {
    div.style.border = ""
    var table = $('#create-table')
    div.style.backgroundColor = $('#colorpicker-2').spectrum('get').toHexString()
  }
}


