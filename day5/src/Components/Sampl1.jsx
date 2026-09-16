import React, { useState } from "react";
//1.Create a react component can have multiple state variable like empid,empname,salary,desg,deptno and print the details.
function Sampl1() {
  const [empid, setEmpid] = useState(1001);
  const [empname, setEmpname] = useState("Anbu");
  const [salary, setSalary] = useState(100000);
  const [desg, setdesg] = useState("Developer");
  const [deptno, setDeptno] = useState(3);

  return (
    <div>
      <h2>Employee details</h2>
      <p>Empid: {empid}</p>
      <p>empname:{empname}</p>
      <p>salary: {salary}</p>
      <p>desg: {desg}</p>
      <p>deptno: {deptno}</p>
    </div>
  );
}

export default Sampl1;
