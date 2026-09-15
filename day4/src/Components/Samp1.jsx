import React, { useState } from "react";

function Samp1() {
  const [input, setInput] = useState("");
  const [submitted, setSubmitted] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    setSubmitted(input);
  };

  return (
    <div>
      <h2>User Input</h2>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Enter something"
        />

        <button type="submit">Submit</button>
      </form>

      <h3>{submitted}</h3>
    </div>
  );
}

export default Samp1;
