import React from "react";

export default function ProfileCrad(props) {
  return (
    <div>
      <h2>{props.name}</h2>
      <p>{props.age}</p>
      <p>{props.role}</p>
      <div>{props.children}</div>
    </div>
  );
}
