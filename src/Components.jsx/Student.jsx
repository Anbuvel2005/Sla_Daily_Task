import React from "react";
import Address from "./Address";
import Product from "./Product";

export default function Student() {
  return (
    <div>
      <h1>Student details</h1>
      <p>Name : Anbuvel</p>
      <p>Subject : English</p>
      <p>Marks:100</p>
      <Address />
      <Product />
    </div>
  );
}
