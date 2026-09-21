import { useState } from "react";
import heroImg from "./assets/hero.png";
import reactLogo from "./assets/react.svg";
import viteLogo from "./assets/vite.svg";
import "./App.css";
import About from "./Components/About";
import Home from "./Components/Home";
import Products from "./Components/Products";
import Reports from "./Components/Reports";
import Contact from "./Components/Contact";
import { Routes, Route } from "react-router-dom";
import Navbar from "./Components/Navbar";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <h2>Menu</h2>
      <Navbar />

      <Routes>
        <Route path="/Home" element={<Home />} />
        <Route path="/About" element={<About />} />
        <Route path="/Products" element={<Products />} />
        <Route path="/Reports" element={<Reports />} />
        <Route path="/Contact" element={<Contact />} />
      </Routes>
    </>
  );
}

export default App;
