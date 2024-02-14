import React from "react";
import Cards from "../Cards/Cards";
import Table from "../Table/Table";
import "./MainDash.css";
import { Input } from "@mui/material";
const MainDash = () => {
  return (
    <div className="MainDash">
      <h1>Dashboard</h1>
      <span>
        <Input type="text"
          placeholder="🔍 Search Icons..."

        >
        </Input>


      </span>

      <Cards />
      <Table />
    </div>
  );
};

export default MainDash;
