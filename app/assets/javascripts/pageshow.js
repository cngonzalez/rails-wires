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

function findElement(event) {
  formId = parseInt($('#changer [name="id"]').val());
  el = pageElements.find(idGet);
  el.changeElement();
  $('#changer :submit').val('Save these changes');
}

function idGet(element){
  return element.id === formId;
}

$(document).ready(function() {
  populateElements();
  $('#changer :submit').on('click', function(e) {
    e.preventDefault();
    if statemenet goes here
    findElement(e);
  });
});


function divChooser(div, num){
  switch(div){
    case 0:
    text = '.element-sidebar';
    break;
    case 1:
    text = '.navbar-collapse';
    break;
    case 2:
    text = '.circle-' + num;
    break;
    case 3:
    text = '.rectangle-' + num;
    break;
    }
  return text;
}
