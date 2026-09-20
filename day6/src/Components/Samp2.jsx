import React, { useEffect, useState } from "react";

export default function Samp2() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    document.title = `Count:${count}`;
    console.log(document.title);
  }, [count]);
  return (
    <div>
      <h2>{count}</h2>
      <button
        onClick={() => {
          setCount(count + 1);
        }}
      >
        Increase
      </button>
    </div>
  );
}
