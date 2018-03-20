function MovingObject(args) {
  this.pos = args['pos'];
  this.vel = args['vel'];
  this.radius = args['radius'];
  this.color = args['color'];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.stroke();
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  if (this.pos[0] > 900) {
    this.pos[0] = 0;
    this.pos[1] = 0;
  }
};

module.exports = MovingObject;
