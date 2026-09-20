import React, { useEffect, useState } from "react";

export default function Samp5() {
  const [input, setInput] = useState("");

  useEffect(() => {
    console.log("Input changed:", input);
  }, [input]);

  return (
    <div>
      <input
        type="text"
        value={input}
        onChange={(e) => setInput(e.target.value)}
      />

      <h3>{input}</h3>
    </div>
  );
}
