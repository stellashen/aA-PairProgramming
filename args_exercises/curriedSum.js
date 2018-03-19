function curriedSum(numArgs) {
  let numbers = [];
  const _curriedSum = function (num) {
    numbers.push(num);
    if (numbers.length >= numArgs) {
      let total = 0;
      for (let i = 0; i < numbers.length; i++ ) {
        total += numbers[i];
      }
      return total;
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
}

// const sum = curriedSum(4);
// sum(5);
// sum(5);
// sum(5);
// console.log(sum(5));
// console.log(
//   sum(5)(30)(20)(1)
// ); // => 56

Function.prototype.curry = function(numArgs) {
  let args = [];
  let fn = this;
  const _curriedFunc = function (arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFunc;
    }
  };
  return _curriedFunc;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
console.log(f1 = f1(6)); // = 30

console.log(sumThree.curry(3)(4)(20)(6));
