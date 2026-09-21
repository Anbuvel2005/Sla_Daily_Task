import React from "react";
import { Link } from "react-router-dom";
export default function Navbar() {
  return (
    <div>
      <nav>
        <Link to="/Home">Home</Link>
        <Link to="/About">About</Link>
        <Link to="/Products">Products</Link>
        <Link to="/Reports">Reports</Link>
        <Link to="/Contact">Contact</Link>
      </nav>
    </div>
  );
}
