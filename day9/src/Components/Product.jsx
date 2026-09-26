import { useEffect, useState } from "react";

function Product() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("https://fakestoreapi.com/products")
      .then((response) => response.json())
      .then((data) => {
        setProducts(data.slice(0, 6));
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  return (
    <div className="min-h-screen bg-gray-100 px-6 py-10">
      <h1 className="mb-8 text-center text-3xl font-bold">Products</h1>

      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {products.map((product) => (
          <div key={product.id} className="rounded-xl bg-white p-5 shadow-lg">
            <img
              src={product.image}
              alt={product.title}
              className="mx-auto h-52 w-full object-contain"
            />

            <h2 className="mt-4 text-lg font-bold">{product.title}</h2>

            <p className="mt-2 text-xl font-semibold text-green-600">
              ${product.price}
            </p>

            <p className="mt-2 text-yellow-500">⭐ {product.rating.rate}</p>

            <button className="mt-4 w-full rounded-lg bg-blue-600 py-2 text-white hover:bg-blue-700">
              Add to Cart
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Product;
