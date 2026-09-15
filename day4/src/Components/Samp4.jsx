import React, { useState } from "react";

function Samp3() {
  const [name, setName] = useState("");

  const handleClick = () => {
    alert("Button clicked");
  };

  const handleMouseOver = () => {
    console.log("Mouse is over the button");
  };

  const handleChange = (e) => {
    setName(e.target.value);
  };

  return (
    <div>
      <h2>Multiple Events</h2>

      <input
        type="text"
        placeholder="Enter your name"
        onChange={handleChange}
      />

      <p>Hello {name}</p>

      <button onClick={handleClick} onMouseOver={handleMouseOver}>
        Submit
      </button>
    </div>
  );
}

export default Samp3;
