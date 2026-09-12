function Button(props) {
  let padding;

  if (props.size === "small") {
    padding = "5px 10px";
  } else if (props.size === "medium") {
    padding = "10px 20px";
  } else if (props.size === "large") {
    padding = "15px 30px";
  }

  return (
    <button
      style={{
        backgroundColor: props.color,
        padding: padding,
        color: "white",
        border: "none",
        margin: "10px",
        cursor: "pointer",
      }}
    >
      {props.children}
    </button>
  );
}

export default Button;
