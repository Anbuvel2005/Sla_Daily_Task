//1. 1 2 3 4 5 6 7 8  series of 1 to 20

// let s = 0;

// for (let i = 1; i <= 20; i++) {
//   s = s + i + " ";
// }
// console.log(s);

//2. 1 3 5 7 9   series of 1 to 20 odd

// let s = 0;

// for (let i = 1; i <= 20; i += 2) {
//   s = s + i + " ";
// }
// console.log(s);

//3. 0 2 4 6 8    series of even 0 to 20

// let s = 0;

// for (let i = 0; i <= 20; i += 2) {
//   s = s + i + " ";
// }
// console.log(s);

//4. 0 5 10 15 20 25(5 series)

// let s = 0;

// for (let i = 0; i <= 20; i += 5) {
//   s = s + i + " ";
// }
// console.log(s);

//5. 1 + 2 + 3 + 4 + .....

// let s = " ";

// for (let i = 1; i <= 20; i++) {
//   s = s + " " + i + " " + "+";
// }

// console.log(s);

//5. 1 + 2 + 3 + 4 + .....
// let s = " ";

// for (let i = 1; i <= 20; i++) {
//   s = s + " " + i + " " + "+";
// }

// console.log(s);

//6. 0 + 2 + 4 + 6 + ...

// let s = " ";

// for (let i = 0; i <= 20; i += 2) {
//   s = s + " " + i + " " + "+";

// }

// console.log(s);

//7. 1 + 3 + 5 + 7 + 9.....

// let s = " ";

// for (let i = 1; i <= 20; i += 2) {
//   s = s + i + " +" + " ";
// }

// console.log(s);

//8. 0 + 5 + 10 + 15 + 20 + .....

// let s = "";
// for (let i = 0; i < 20; i += 5) {
//   s = s + i + " " + "+" + " ";
// }
// console.log(s);

//9. 1 / 1! + 2 / 2! + 3 / 3! + 4 / 4!.....
// let s = "";
// for (let i = 1; i < 20; i++) {
//   s = s + i + " /" + " " + i + "!" + " " + "+" + " ";
// }
// console.log(s);

//10.  0 + 2 / 2! + 4 / 4! + 6 / 6!....
// let s = "";
// for (let i = 0; i < 20; i += 2) {
//   s = s + i + " /" + " " + i + "!" + " " + "+" + " ";
// }
// console.log(s);

//11. 1 / 1! + 3 / 3! + 5 / 5!....

let s = "";
for (let i = 1; i < 20; i += 2) {
  s = s + i + " /" + " " + i + "!" + " " + "+" + " ";
}
console.log(s);
