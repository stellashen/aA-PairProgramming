// Function.prototype.inherits = function(parent) {
//   var Surrogate = function() {};
//   Surrogate.prototype = parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// };
//
// function MovingObject () {}
//
// function Ship () {}
// Ship.inherits(MovingObject);
//
// function Asteroid () {}
// Asteroid.inherits(MovingObject);
//
// console.log(Asteroid.prototype);
// console.log(MovingObject.prototype);
//
// let inst = new Asteroid();
// inst.sum = function() {
//   console.log("hello");
// };
// console.log(inst.prototype);


Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};
