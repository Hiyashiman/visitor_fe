import React from "react";
import Chart from "react-apexcharts";


const CustomerReview = () => {
  const data = {
    series: [
      {
        name: "Uesr",
        data: [10, 5, 3, 9, 4, 12, 10, 11, 2, 3, 4,],
      },
    ],
    options: {
      chart: {
        type: "area",
        height: "auto",
      },

      fill: {
        colors: ["#fff"],
        type: "gradient",
      },
      dataLabels: {
        enabled: false,
      },
      stroke: {
        curve: "smooth",
        colors: ["#ff929f"],
      },
      tooltip: {
        x: {
          format: "dd/MM/yy HH:mm",
        },
      },
      grid: {
        show: false,
      },
      xaxis: {
        type: "datetime",
        categories: [
          "2018-09-19T08:00:00.000Z",
          "2018-09-19T09:00:00.000Z",
          "2018-09-19T10:00:00.000Z",
          "2018-09-19T11:00:00.000Z",
          "2018-09-19T12:00:00.000Z",
          "2018-09-19T13:00:00.000Z",
          "2018-09-19T14:00:00.000Z",
          "2018-09-19T15:00:00.000Z",
          "2018-09-19T16:00:00.000Z",
          "2018-09-19T17:00:00.000Z",
          "2018-09-19T18:00:00.000Z",
          "2018-09-19T19:00:00.000Z",
     
          
        ],
      },
      yaxis: {
        show: false
      },
      toolbar:{
        show: false
      }
    },
  };
  return <div className="CustomerReview">
        <Chart options={data.options} series={data.series} type="area" />
  </div>;
};

export default CustomerReview;
