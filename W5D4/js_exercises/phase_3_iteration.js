Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        sorted = false;
        swap(this, i, i+1);
      }
    }
  }

  return this;
};

function swap (arr, x, y) {
  let temp = arr[x];
  arr[x] = arr[y];
  arr[y] = temp;
}

String.prototype.substrings = function() {
  let result = [];
  let letters = this.split('');
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      result.push(letters.slice(i, j + 1).join(''));
    }
  }
  return result;
};
