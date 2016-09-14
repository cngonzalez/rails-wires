
function Element(hash) {
  this.color = hash['color'];
  this.size = hash['size'];
  this.position = hash['position'];
  this.id = hash['id'];
  var self = this;
  className = divChooser(hash['div'], hash['id']);
  this.onPage = $(className)[0];
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

Element.prototype.changeElement = function() {
  this.updateElement();
  this.onPage.style.backgroundColor = $("input#color").val();
  this.onPage.style.borderColor = $("input#color").val();
  this.sizeChanger($("input#size").val());
}

Element.prototype.updateElement = function() {

}

Element.prototype.sizeChanger = function(num) {
  switch(num){
    case "1":
    this.onPage.style.maxWidth = "400px";
    this.onPage.style.maxHeight = "400px";
    break;
    case "2":
    this.onPage.style.maxWidth = "500px";
    this.onPage.style.maxHeight = "500px";
    break;
    case "3":
    this.onPage.style.maxWidth = "650px";
    this.onPage.style.maxHeight = "650px";
    break;
  }
}
