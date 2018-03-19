function curriedSum(numArgs) {
  let numbers = [];
  let args = numArgs;
  const _curriedSum = function (num) {
    numbers.push(num);
    if (numbers.length === args) {
      let total = 0;
      for (let i = 0; i < numbers.length; i++ ) {
        total += numbers[i];
      }
      return total;
    }
  };

  return _curriedSum;
}

// const sum = curriedSum(4);
// sum(5);
// sum(5);
// sum(5);
// console.log(sum(5));
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let numrg = numArgs;
  const sum = function (arg) {
    numbers.push(arg);
    if (numbers.length === numrg) {
      let total = 0;
      for (let i = 0; i < numbers.length; i++ ) {
        total += numbers[i];
      }
      return total;
    }
  };
  return sum;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

let f1 = sumThree().curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
