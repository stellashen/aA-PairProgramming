console.log("Webpack is working!");
const MovingObject = require("./moving_object.js");

// window.MovingObject = MovingObject;


const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);


// const canvasEl = document.getElementsByTagName("canvas")[0];



document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.height = 900;
  canvasEl.width = 900;

  const ctx = canvasEl.getContext("2d");

  mo.draw(ctx);
  setInterval(function(){ ctx.clearRect(0, 0, canvasEl.width, canvasEl.height); mo.move(); mo.draw(ctx); }, 100);
});
