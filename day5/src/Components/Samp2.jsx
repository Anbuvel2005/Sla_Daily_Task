import React, { useState } from "react";

// Create a React component that should store the product
// information using a state object and change it with new values.

function Samp2() {
  const [product, setProduct] = useState({
    productname: "Laptop",
    productprice: 100000,
    productquantity: 2,
    year: 2000,
  });

  function handleSubmit(e) {
    e.preventDefault();

    setProduct({
      productname: "Mobile",
      productprice: 120000,
      productquantity: 5,
      year: 2005,
    });
  }

  return (
    <div>
      <h2>Product Information</h2>

      <p>Product Name: {product.productname}</p>
      <p>Product Price: {product.productprice}</p>
      <p>Product Quantity: {product.productquantity}</p>
      <p>Year: {product.year}</p>

      <form onSubmit={handleSubmit}>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default Samp2;
