// 1. Find the Sum and Average of Array Elements

const arr = [10, 20, 30, 40, 50];

let sum = 0;

for (let i = 0; i < arr.length; i++) {
  sum += arr[i];
}

let avg = sum / arr.length;

console.log("Sum:", sum);
console.log("Average:", avg);


// 2. Find the Largest Element

const arr = [10, 45, 20, 80, 35];

let largest = arr[0];

for (let i = 1; i < arr.length; i++) {
  if (arr[i] > largest) {
    largest = arr[i];
  }
}

console.log(largest);

// 3. Find the Smallest Element

const arr = [10, 45, 20, 80, 35];

let smallest = arr[0];

for (let i = 1; i < arr.length; i++) {
  if (arr[i] < smallest) {
    smallest = arr[i];
  }
}

console.log(smallest);

// 4. Count Positive and Negative Numbers

const arr = [10, -5, 7, -2, 0, 15, -9];

let positive = 0;
let negative = 0;

for (let i = 0; i < arr.length; i++) {
  if (arr[i] > 0) {
    positive++;
  } else if (arr[i] < 0) {
    negative++;
  }
}

console.log("Positive:", positive);
console.log("Negative:", negative);

// 5. Print Duplicate Elements

const arr = [1, 2, 3, 2, 4, 5, 3, 6];

for (let i = 0; i < arr.length; i++) {
  for (let j = i + 1; j < arr.length; j++) {
    if (arr[i] == arr[j]) {
      console.log(arr[i]);
      break;
    }
  }
}

// 6. Search an Element

const arr = [10, 20, 30, 40, 50];

const key = 30;

let found = false;

for (let i = 0; i < arr.length; i++) {
  if (arr[i] == key) {
    found = true;
    break;
  }
}

console.log(found ? "Found" : "Not Found");


// 8. Check Whether an Array is Sorted

const arr = [10, 20, 30, 40, 50];

let sorted = true;

for (let i = 0; i < arr.length - 1; i++) {
  if (arr[i] > arr[i + 1]) {
    sorted = false;
    break;
  }
}

console.log(sorted ? "Sorted" : "Not Sorted");

// 9. Find the Missing Number (1 to n)

const arr = [1, 2, 3, 5];

const n = 5;

let total = (n * (n + 1)) / 2;

let sum = 0;

for (let i = 0; i < arr.length; i++) {
  sum += arr[i];
}

console.log("Missing Number:", total - sum);

// 10. Separate Even and Odd Numbers

const arr = [10, 15, 20, 25, 30, 35];

let even = [];
let odd = [];

for (let i = 0; i < arr.length; i++) {
  if (arr[i] % 2 == 0) {
    even.push(arr[i]);
  } else {
    odd.push(arr[i]);
  }
}

console.log("Even:", even);
console.log("Odd:", odd);