import React, { useEffect } from "react";
//1.Display a Greating message when the component loads (only one time)
export default function Samp1() {
  useEffect(() => {
    alert("Welcome");
  }, []);
  return (
    <div>
      <h2>Sample1</h2>
    </div>
  );
}
