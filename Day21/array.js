// // 1. Push, Pop, Shift, Unshift

// const arr = [10, 20, 30];

// arr.push(40);
// console.log(arr);

// arr.pop();
// console.log(arr);

// arr.unshift(5);
// console.log(arr);

// arr.shift();
// console.log(arr);

// // 2. Print all elements using for loop

// const arr = [10, 20, 30, 40, 50];

// for (let i = 0; i < arr.length; i++) {
//   console.log(arr[i]);
// }

// 3. Use map to double all numbers

const arr = [1, 2, 3, 4, 5];

const result = arr.map((num) => num * 2);

console.log(result);

//
const arr = [1, 2, 3, 4, 5, 6];
const result = arr.filter((num) => num % 2 == 0);

console.log(result);

// 5. Use reduce to find the sum

const arr = [10, 20, 30, 40];

const reduce = arr.reduce((total, num) => total + num, 0);
console.log(reduce);

// 6. Find the first number greater than 10

const arr = [3, 6, 8, 12, 15, 20];

const result = arr.find((num) => num > 10);

console.log(result);

// 7. Check if array includes a specific value

const arr = [10, 20, 30, 40];

console.log(arr.includes(20));
console.log(arr.includes(100));
