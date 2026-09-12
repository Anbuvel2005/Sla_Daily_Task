import { useState } from "react";
import heroImg from "./assets/hero.png";
import reactLogo from "./assets/react.svg";
import viteLogo from "./assets/vite.svg";
import "./App.css";
import ProfileCrad from "./Component/ProfileCrad";
import Button from "./Component/Button";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <ProfileCrad name="Anbu" age={25} role="dev">
        <p>like react and javascript</p>
      </ProfileCrad>
      <ProfileCrad name="Anbuv" age={25} role="dev">
        <p>like react and javascript</p>
      </ProfileCrad>
      <ProfileCrad name="Anbuvel" age={25} role="dev">
        <p>like react and javascript</p>
      </ProfileCrad>

      <Button color="red" size="small">
        Submit
      </Button>
      <Button color="blue" size="medium">
        Submit
      </Button>
      <Button color="yellow" size="large">
        Submit
      </Button>
    </>
  );
}

export default App;
