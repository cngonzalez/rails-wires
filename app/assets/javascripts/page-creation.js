$(document).ready(function() {
  $("#colorpicker-1").spectrum({
    color: "grey",
    showInput: true,
    move: function(tinycolor) {
      var els = getActiveElements()
      var color = tinycolor.toHexString()
      changeElementsColor(els, color)
    }
  });
  $("#colorpicker-2").spectrum({
    color: "grey",
    showInput: true,
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
    color: "white",
    showInput: true,
    move: function(tinycolor) {
      var color = tinycolor.toHexString()
      $('#create-table').css('color', color)
    }
  })

  $(".cell-contents").on('click', function(e) {
    toggleShape(e)
  })

  $('#submit-this').on('click', function(e) {
    e.preventDefault();
    postToPage();
  })

});



function divType(id){
  onPage = $(id)[0]
  if (onPage.style.borderRadius == "50%") {
    var response = "2"
  }
  else { 
    var response = "3"
  }
  return response
}

function postToPage(){
  var formElements = getActiveElements()
  var elementArr = []
  for (var i = 0; i < formElements.length; i++) { 
    var div = divType(formElements[i])
    elementArr.push({
      "div": div,
      "size": "1",
      "position": formElements[i].replace(/#cell-/, "")
    })
  }
  elementArr.push({
    "div": "1",
    "size": "1",
    "position": "1"
  })
  var data = {"page": {
    "name": $('input#page-name').val(),
    "body_color": $('#colorpicker-2').spectrum('get').toHexString(),
    "text_color": $('#colorpicker-3').spectrum('get').toHexString(),
    "accent_color": $('#colorpicker-1').spectrum('get').toHexString(),
    "elements_attributes": elementArr
  }}

  $.ajax({
    url: '/pages',
    type: 'POST',
    data: data
  }).done(function(response) {
    console.log(response)
  })

}

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

