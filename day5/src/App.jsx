import { useState } from "react";
import heroImg from "./assets/hero.png";
import reactLogo from "./assets/react.svg";
import viteLogo from "./assets/vite.svg";
import "./App.css";

import Sampl1 from "./Components/sampl1";
import Samp2 from "./Components/Samp2";
import Samp3 from "./Components/Samp3";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Sampl1 />
      <Samp2 />
      <Samp3 />
    </>
  );
}

export default App;
