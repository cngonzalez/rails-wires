$(document).ready(function() {
  $("#colorpicker-1").spectrum({
    color: "grey",
    move: function(tinycolor) {
      var els = getActiveElements()
      var color = tinycolor.toHexString()
      changeElementsColor(els, color)
    }
  });
  $("#colorpicker-2").spectrum({
    color: "grey",
    move: function(tinycolor) {
      var els = getInactiveElements()
      var color = tinycolor.toHexString()
      var table = $('#create-table')[0]
      table.style.backgroundColor = color
      $('#create-table td').each(function(i) {
        this.style.backgroundColor = color
      })
      changeElementsColor(els, color)
    }
  })
  $("#colorpicker-3").spectrum({
    color: "white"
  })
  $(".cell-contents").on('click', function(e) {
    toggleShape(e)
  })
});

function changeElementsColor(els, color) {
  for (var i = 0; i <  els.length; i++) {
    var element = $(els[i])[0]
    element.style.backgroundColor = color
  }
}
function getActiveElements() {
  var active = []
  $('.cell-contents').each(function(cell) {
    if (this.style.border != "") {
      active.push("#" + this.id)
    }
  })
  return active
}

function getInactiveElements() {
  var inactive = []
  $('.cell-contents').each(function(cell) {
    if (this.style.border == "") {
      inactive.push("#" + this.id)
    }
  })
  return inactive
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
    div.style.backgroundColor = $('#colorpicker-2').spectrum('get').toHexString()
  }
}

