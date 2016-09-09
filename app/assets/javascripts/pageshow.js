var pageElements = [];

function Element(hash) {
  this.color = hash['color'];
  this.size = hash['size'];
  this.position = hash['position'];
  this.id = hash['id']
  var self = this;
  className = divChooser(hash['div'], hash['id']);
  this.onPage = document.getElementsByClassName(className)[0];
  this.onPage.addEventListener('click', function(){
    self.formFill();
  });
}

Element.prototype.formFill = function() {
  $("input#color").val(this.color);
  $("input#position").val(this.position);
  $("input#size").val(this.size);
  $("input#id").val(this.id);
}

function populateElements() {
  pageNumber = window.location.href.split("/pages/")[1];
  $.get('/pages/' + pageNumber + '.json').done(function(data) {
    jsElements = data['elements'].map(function(el){
      element = new Element(el);
      pageElements.push(element);
      return element;
    });
  });
}

function changeElement(event) {
  debugger;
}

$(document).ready(function() {
  populateElements();
  $('input[type=button][value="Apply changes"]').on('click', function(e) {
    debugger;
    e.preventDefault();
    changeElement(e);
  });
});


function divChooser(div, num){
  switch(div){
    case 0:
    text = 'element-sidebar';
    break;
    case 1:
    text = 'navbar-collapse';
    break;
    case 2:
    text = 'circle-' + num;
    break;
    case 3:
    text = 'rectangle-' + num;
    break;
    default:
    text = 'none';
  }
  return text;
}
