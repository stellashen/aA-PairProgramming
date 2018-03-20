const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
    return;
  }

  reader.question("What is your number?", function(answer){
    console.log(`Your number is ${answer}`);
    let num = parseInt(answer);
    addNumbers(sum + num, numsLeft - 1, completionCallback);
  });

  console.log("I get printed before you even answer!");
}

// function addNumbers()

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
