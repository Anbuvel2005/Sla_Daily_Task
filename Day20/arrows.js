// const series = () => {
//   let s = "";
//   for (let i = 1; i <= 20; i++) {
//     s += i + " ";
//   }
//   console.log(s);
// };

// series();

// const series1 = (a, b) => {
//   let s = "";
//   for (let i = a; i <= b; i++) {
//     s += i + " ";
//   }
//   console.log(s);
// };

// series1(1, 20);

// const series2 = (a, b) => {
//   let s = "";
//   for (let i = a; i <= b; i++) {
//     s += i + " ";
//   }
//   return s;
// };

// console.log(series2(1, 20));

// const oddSeries = (a = 1, b = 20) => {
//   let s = "";
//   for (let i = a; i <= b; i += 2) {
//     s += i + " ";
//   }
//   return s;
// };

// console.log(oddSeries());

// const evenSeries = (a = 0, b = 20) => {
//   let s = "";
//   for (let i = a; i <= b; i += 2) {
//     s += i + " ";
//   }
//   return s;
// };

// console.log(evenSeries());

// const fiveSeries = (a = 0, b = 20) => {
//   let s = "";
//   for (let i = a; i <= b; i += 5) {
//     s += i + " ";
//   }
//   return s;
// };

// console.log(fiveSeries());

// const sumSeries = (a = 1, b = 20) => {
//   let s = "";
//   for (let i = a; i <= b; i++) {
//     s += i + " + ";
//   }
//   return s;
// };

// console.log(sumSeries());

// const factorialSeries = (a = 1, b = 20) => {
//   let s = "";
//   for (let i = a; i <= b; i++) {
//     s += i + "/" + i + "! + ";
//   }
//   return s;
// };

// console.log(factorialSeries());

// const fact = (num = 5) => {
//   let f = 1;
//   for (let i = num; i >= 1; i--) {
//     f *= i;
//   }
//   return f;
// };

// console.log(fact());


// const prime = (n = 5) => {
//   let f = 0;

//   for (let i = 1; i <= n; i++) {
//     if (n % i == 0) {
//       f++;
//     }
//   }

//   return f == 2;
// };

// console.log(prime());

// const primeSeries = (last = 50) => {
//   let s = "";

//   for (let n = 1; n <= last; n++) {
//     let f = 0;

//     for (let i = 1; i <= n; i++) {
//       if (n % i == 0) {
//         f++;
//       }
//     }

//     if (f == 2) {
//       s += n + " ";
//     }
//   }

//   return s;
// };

// console.log(primeSeries());

// const armstrong = (n = 153) => {
//   let temp = n;
//   let sum = 0;
//   let r;

//   while (temp > 0) {
//     r = temp % 10;
//     sum += r * r * r;
//     temp = parseInt(temp / 10);
//   }

//   return sum == n;
// };

// console.log(armstrong());

// const armstrongSeries = (last = 1000) => {
//   let s = "";

//   for (let n = 1; n <= last; n++) {
//     let temp = n;
//     let sum = 0;
//     let r;

//     while (temp > 0) {
//       r = temp % 10;
//       sum += r * r * r;
//       temp = parseInt(temp / 10);
//     }

//     if (sum == n) {
//       s += n + " ";
//     }
//   }

//   return s;
// };

// console.log(armstrongSeries());

// const sumAvg = (n = 10) => {
//   let sum = 0;

//   for (let i = 1; i <= n; i++) {
//     sum += i;
//   }

//   return {
//     sum,
//     avg: sum / n,
//   };
// };

// console.log(sumAvg());

// const sumDigits = (n = 147) => {
//   let sum = 0;

//   while (n > 0) {
//     let r = n % 10;
//     sum += r;
//     n = parseInt(n / 10);
//   }

//   return sum;
// };

// console.log(sumDigits());

// const palindrome = (str = "MALAYALAM") => {
//   let rev = "";

//   for (let i = str.length - 1; i >= 0; i--) {
//     rev += str[i];
//   }

//   return str == rev;
// };

// console.log(palindrome());

// //12.factorial of a given no // 5!=5*4*3*2*1 =120

// // const fact = (n) => {
// //   let f = 1;
// //   for (let i = n; i >= 1; i--) {
// //     f *= i;
// //   }
// //   return f;
// // };

// // console.log(fact(5));

// //13.find out the given no is prime or not

// // const primeOrnot = (n) => {
// //   let count = 0;
// //   for (let i = 1; i <= n; i++) {
// //     if (n % i == 0) {
// //       count++;
// //     }
// //   }
// //   if (count == 2) {
// //     console.log("prime");
// //   } else {
// //     console.log("not prime");
// //   }
// // };

// // primeOrnot(3);

// // 14.print the prime no series
// // const primeOrnot = (n) => {
// //   let count = 0;
// //   for (let i = 1; i <= n; i++) {
// //     if (n % i == 0) {
// //       count++;
// //     }
// //   }
// //   if (count == 2) {
// //     console.log(n);
// //   }
// // };

// // for (let i = 1; i <= 50; i++) {
// //   primeOrnot(i);
// // }

// //15.find out the given no is Armstrong no or not (153= 1 ^ 3 + 5 ^ 3 + 3 ^ 3 = 153)

// // const arms = (n) => {
// //   let temp = n;
// //   let power = 0;
// //   let r = 0;
// //   while (temp > 0) {
// //     r = temp % 10;
// //     power = power + r * r * r;
// //     temp = parseInt(temp / 10);
// //   }
// //   if (power == n) {
// //     console.log("arms");
// //   } else {
// //     console.log("not a arms");
// //   }
// // };

// // arms(153);

// //16.print the Armstrong no series

// const arms = (n) => {
//   let temp = n;
//   let power = 0;
//   let r = 0;
//   while (temp > 0) {
//     r = temp % 10;
//     power = power + r * r * r;
//     temp = parseInt(temp / 10);
//   }
//   if (power == n) {
//     console.log(n);
//   }
// };

// for (let i = 1; i <= 500; i++) {
//   arms(i);
// }
