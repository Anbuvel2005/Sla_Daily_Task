import React, { useEffect, useState } from "react";

export default function Samp3() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setCount((prevCount) => prevCount + 1);
    }, 5000);

    return () => clearInterval(timer);
  }, []);

  return (
    <div>
      <h2>Timer: {count}</h2>
    </div>
  );
}
