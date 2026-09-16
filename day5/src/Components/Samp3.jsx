import React, { useState } from "react";

function Samp3() {
  const [customers, setCustomers] = useState(["Anbu", "Arun", "Karthik"]);

  const [customerName, setCustomerName] = useState("");

  function addCustomer() {
    if (customerName !== "") {
      setCustomers([...customers, customerName]);
      setCustomerName("");
    }
  }

  function deleteCustomer(name) {
    setCustomers(customers.filter((customer) => customer !== name));
  }

  return (
    <div>
      <h2>Customer List</h2>

      <input
        type="text"
        value={customerName}
        onChange={(e) => setCustomerName(e.target.value)}
        placeholder="Enter customer name"
      />

      <button onClick={addCustomer}>Add</button>

      <ul>
        {customers.map((customer, index) => (
          <li key={index}>
            {customer}
            <button onClick={() => deleteCustomer(customer)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Samp3;
