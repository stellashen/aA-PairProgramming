Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const result = [];

  this.myEach( (num) => result.push(callback(num)));
  return result;
};

Array.prototype.myReduce = function (callback, initialValue) {
  let idx = 0;
  let accumulator = this[0];
  if (initialValue !== undefined) {
    accumulator = initialValue;
  } else {
    idx = 1;
  }
  while (idx < this.length) {
    accumulator = callback(this[idx], accumulator);
    idx++;
  }
  return accumulator;
};



function double(num) {
    return num * 2;
}

function add(num, acc) {
    return num + acc;
}

function multiply(num, acc) {
    return num * acc;
}
