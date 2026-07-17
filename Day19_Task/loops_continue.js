//12.factorial of a given no // 5!=5*4*3*2*1 =120

// let num = prompt("enter the num:");
// console.log(num);

// let f = 1;
// for (let i = num; i >= 1; i--) {
//   f = f * i;
// }

// console.log(f);

//13.find out the given no is prime or not

// let n = Number(prompt("Enter a number")); // 5

// let f = 0;

// for (let i = 1; i <= n; i++) {
//   if (n % i == 0) {
//     f++;
//   }
// }
// c;
// if (f == 2) {
//   console.log(`Given number ${n} is Prime`);
// } else {
//   console.log(`Given number ${n} is Not Prime`);
// }

// let n = Number(prompt("Enter a number")); // 5
// console.log(n);

// for (let n = 1; n <= 50; n++) {
//   let f = 0;

//   for (
//     let i = 1;
//     i <= n;
//     i++ //1 2 3 4 5 6
//   ) {
//     if (n % i == 0) {
//       f++; //1 2
//     }
//   }

//   if (f == 2) {
//     console.log(n);
//   }
// }

// 15.find out the given no is Armstrong no or not (153= 1 ^ 3 + 5 ^ 3 + 3 ^ 3 = 153)

//  let r,temp,sum=0;

//  let n=Number(prompt("Enter a number to find Armstrong or not")); //153

//  temp=n;

//  while(temp>0)

// {

//  r=parseInt(temp)%10; //3 5 1

//  sum+=r*r*r; //0+27+ 125=152 152+1 =153

// temp=parseInt(temp)/10; //15 1

// }

//  if(sum==n)

//  {

//  console.log(`The Given no ${n} is an armstrong number`);

//  }
//  else{

// console.log(`The Given no ${n} is not an armstrong number`);

//  }

// // 16.print the Armstrong no series
// let n = 1;

// while (n <= 1000) {
//     let r, temp, sum = 0;

//     temp = n;

//     while (temp > 0) {
//         r = parseInt(temp) % 10;
//         sum += r * r * r;
//         temp = parseInt(temp / 10);
//     }

//     if (sum == n) {
//         console.log(n);
//     }

//     n++;
// }

// let n = Number(prompt("Enter the last number for the series"));

// let sum = 0;

// for (let i = 1; i <= n; i++) {
//   sum += i;
// }

// console.log("Sum of Series = " + sum);
// console.log(`Avg of Series = ${sum / n}`);

// 19. Sum of Digits (147 = 1 + 4 + 7 = 12)

// let n = Number(prompt("Enter a number to find the sum of digits"));

// let r,
//   sum = 0;

// while (n > 0) {
//   r = parseInt(n) % 10;
//   sum += r;
//   n = parseInt(n / 10);
// }

// console.log("Sum of digits = " + sum);

// 20. Palindrome or Not (BAAB, MALAYALAM, 1221)

// let s = prompt("Enter a string to find out whether it is a palindrome or not");

// let p = "";

// for (let i = s.length - 1; i >= 0; i--) {
//     p += s[i];
// }

// if (p == s) {
//     console.log("Palindrome");
// } else {
//     console.log("Not a Palindrome");
// }
