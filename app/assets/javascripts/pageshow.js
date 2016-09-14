var pageElements = [];
var formId = 0;

function populateElements() {
  pageNumber = window.location.href.split("/pages/")[1];
  $.get('/pages/' + pageNumber + '.json').done(function(data) {
    pageElements = data['elements'].map(function(el){
      element = new Element(el);
      return element;
    });
  });
}

function getElement() {
  formId = parseInt($('#changer [name="id"]').val());
  el = pageElements.find(idGet);
  return el;
}

function idGet(element){
  return element.id === formId;
}

function applyChanges() {
  el = getElement();
  el.changeElement();
  $('#changer :submit').val('Save these changes');
}


function applyOrSave(){
  if ($("#changer :submit").val() === "Apply changes") {
    applyChanges();
  }
  else if ($("#changer :submit").val() === "Save these changes") {
    el = getElement();
    el.updateElement();
  }
}


$(document).ready(function() {
  populateElements();
  $('#changer :submit').on('click', function(e) {
    e.preventDefault();
    applyOrSave();
  });
});
