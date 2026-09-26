import { useState } from "react";
import heroImg from "./assets/hero.png";
import reactLogo from "./assets/react.svg";
import viteLogo from "./assets/vite.svg";
import "./App.css";
import ProfileCard from "./Components/ProfileCard";
import Navbar from "./Components/Navbar";
import Product from "./Components/Product";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <ProfileCard />
      <Navbar />
      <Product />
    </>
  );
}

export default App;
