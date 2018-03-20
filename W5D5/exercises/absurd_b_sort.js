const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1,el2,callback){
  reader.question(`Is ${el1} > ${el2}`, function (answer) {
    if (answer === 'yes'){
      callback(true);
      // reader.close();
    }else{
      callback(false);
      // reader.close();
    }
  });
}

// askIfGreaterThan(2,3, function (answer) {
//   console.log(`${answer}`); reader.close();
// });

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i],arr[i+1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        madeAnySwaps = true;

      }
      console.log(`${arr}`);
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
    });
  }else{
    outerBubbleSortLoop(arr, madeAnySwaps);
  }
}

function outerBubbleSortLoop(arr, madeAnySwaps){
  if (madeAnySwaps === false){
    reader.close();
    return arr;
  }
  innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
}

outerBubbleSortLoop([4,23,5,1,2,54], true);
