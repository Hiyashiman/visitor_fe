import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import "./Table.css";

function createData(name, Idcard,trackingId, date, business) {
  return { name, Idcard,trackingId, date, business };
}

const rows = [
  createData("Lasania Fri","110000000001","2 March 2022", 1,"สัมภาษณ์งาน"),
  createData("Big Bang ","110000000002","2 March 2022", 2,"ส่งเอกสาร"),
  createData("Mouth Freshner","110000000003", "2 March 2022",3,"ประชุม"),
  createData("Cupcake","110000000004","2 March 2022", 4,"ส่งเอกสาร" ),0
];




export default function BasicTable() {
  return (
      <div className="Table">
      <h3>Recent Orders</h3>
        <TableContainer
          component={Paper}
          style={{ boxShadow: "0px 13px 20px 0px #80808029" }}
        >
          <Table sx={{ minWidth: 650 }} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Name</TableCell>
                <TableCell align="left">Idcard</TableCell>
                <TableCell align="left">Date</TableCell>
                <TableCell align="left">Floor</TableCell>
                <TableCell align="left">Business</TableCell>
              </TableRow>
            </TableHead>
            <TableBody style={{ color: "white" }}>
              {rows.map((row) => (
                <TableRow
                  key={row.name}
                  sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                >
                  <TableCell component="th" scope="row">{row.name}</TableCell>
                  <TableCell align="left">{row.Idcard}</TableCell>
                  <TableCell align="left">{row.trackingId}</TableCell>
                  <TableCell align="left">{row.date}</TableCell>
                  <TableCell align="left">{row.business}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      </div>
  );
}
