import React, { useState } from "react";

function Samp5() {
  const [input, setInput] = useState("");
  const [output, setOutput] = useState("");

  const handleBlur = () => {
    setOutput(input);
  };

  return (
    <div>
      <h2>User Input</h2>

      <input
        type="text"
        value={input}
        onChange={(e) => setInput(e.target.value)}
        onBlur={handleBlur}
        placeholder="Enter something"
      />

      <h3>{output}</h3>
    </div>
  );
}

export default Samp5;
