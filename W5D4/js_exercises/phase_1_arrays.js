Array.prototype.uniq = function() {
  const arr = [];
  this.forEach((el) => {
    if (!arr.includes(el)) {
      arr.push(el);
    }
  });
  return arr;
};

Array.prototype.twoSum = function() {
  const result = [];

  for(let i = 0; i < this.length; i++ ) {
    for(let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

Array.prototype.transpose = function() {
  const result = (new Array(this.length)).fill(0).map(
    function() {
      return new Array(this.length);
    }
  );
  
  for(let i = 0; i < this.length; i++ ) {
    for(let j = 0; j < this.length; j++) {
      result[j][i] = this[i][j];
    }
  }

  return result;
};
