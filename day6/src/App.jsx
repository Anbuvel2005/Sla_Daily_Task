import { useState } from "react";
import heroImg from "./assets/hero.png";
import reactLogo from "./assets/react.svg";
import viteLogo from "./assets/vite.svg";
import "./App.css";
import Samp1 from "./Components/Samp1";
import Samp2 from "./Components/Samp2";
import Samp3 from "./Components/Samp3";
import Samp5 from "./Components/Samp5";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      {/* <Samp1 /> */}
      {/* <Samp2 /> */}
      {/* <Samp3 /> */}
      {/* <Samp4 /> */}
      <Samp5 />
    </>
  );
}

export default App;
