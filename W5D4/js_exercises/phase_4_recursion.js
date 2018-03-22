function range(start, end) {
  if (start === end) {
    return [start];
  }

  let prev = range(start, end - 1);
  prev.push(end);
  return prev;
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }

  let prev = sumRec(arr.slice(0, arr.length - 1));
  return prev + arr[arr.length - 1];
}

function exponent1(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent1(base, exp - 1);
}

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }

  if (exp === 1) {
    return base;
  }

  let result = 0;
  if (exp % 2 === 0) {
    result = Math.pow(exponent2(base, exp / 2), 2);
  } else {
    result = base * Math.pow(exponent2(base, (exp - 1)/2) ,2);
  }
  return result;
}

function fibonacci(n) {
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return [1, 1];
  }
  let prevFib = fibonacci(n - 1);
  prevFib.push(prevFib[prevFib.length - 1] + prevFib[prevFib.length - 2]);
  return prevFib;
}

function deepDup(arr) {
  let result = [];

  for(let i = 0; i < arr.length; i++) {
    if (typeof arr[i] === 'object' ) {
      result.push(deepDup(arr[i]));
    } else {
      result.push(arr[i]);
    }
  }

  return result;
}

function bsearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }

  let mid = Math.floor(arr.length / 2);

  if (arr[mid] === target) {
    return mid;
  } else if (arr[mid] > target ) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    let bresult = bsearch(arr.slice(mid + 1, arr.length), target);

    if (bresult === -1) {
      return - 1;
    } else {
      return mid + 1 + bresult;
    }
  }
}


function mergesort(arr) {
  if (arr.length === 1) {
    return [arr[0]];
  }

  let mid = Math.floor(arr.length / 2);

  let left = arr.slice(0, mid);
  let right = arr.slice(mid, arr.length);

  let mergeLeft = mergesort(left);
  let mergeRight = mergesort(right);
  return merge(mergeLeft, mergeRight);
}

function merge(left, right) {
  let merged = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left).concat(right);
}

function subsets(arr) {
  if (arr.length === 1) {
    return [[], arr];
  }

  let el = arr.shift();
  let prev = subsets(arr);
  let result = [];

  for (let i = 0; i < prev.length; i++) {

    // let newSet = prev[i].push(el); => return value is a number, not prev[i]

    // prev[i].push(el);
    // let newSet = prev[i]; - mutated prev[i], still wrong
    let newSet = [el].concat(prev[i]);
    result.push(newSet);
  }

  return prev.concat(result);
}
