import React, { useState } from "react";
//2.Create a react component to display the user input when you click / Double click the button.
function Samp2() {
  const [input, setInput] = useState("");
  const [submitted, setSubmitted] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    setSubmitted(input);
  };

  return (
    <div>
      <h2>User Input</h2>

      <input
        type="text"
        value={input}
        onChange={(e) => setInput(e.target.value)}
        placeholder="Enter something"
      />

      <button onClick={handleSubmit}>Submit</button>

      <h3>{submitted}</h3>
    </div>
  );
}

export default Samp2;
