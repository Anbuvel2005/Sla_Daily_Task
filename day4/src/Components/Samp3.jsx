import React from "react";
//3.Create a react component to Passing a Value to an Event
export default function Samp3() {
  const handlesubmit = (name) => {
    console.log("Hello" + name);
  };

  return (
    <div>
      <button onClick={() => handlesubmit("Anbu")}>Click</button>
    </div>
  );
}
