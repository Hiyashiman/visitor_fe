// Sidebar imports
import {
  UilEstate,
  UilClipboardAlt,
  UilUsersAlt,
  UilPackage,
  UilChart,
  UilSignOutAlt,
} from "@iconscout/react-unicons";

// Analytics Cards imports
import { UilUsdSquare, UilMoneyWithdrawal } from "@iconscout/react-unicons";
import { keyboard } from "@testing-library/user-event/dist/keyboard";

// Recent Card Imports

// import img1 from "../imgs/img1.png";
// import img2 from "../imgs/img2.png";
// import img3 from "../imgs/img3.png";

// Sidebar Data
// export const SidebarData = [
//   {
//     icon: UilEstate,
//     heading: "Dashboard",
//   },
//   {
//     icon: UilUsersAlt,
//     heading: "editor",
//   },
//   {
//     icon: UilChart,
//     heading: 'Analytics'
//   },
// ];

// Analytics Cards Data
export const cardsData = [
  {
    title: "",
    color: {
      backGround: "linear-gradient(180deg, #bb67ff 0%, #c484f3 100%)",
      boxShadow: "0px 10px 20px 0px #e0c6f5",
    },
    barValue: 70,
    value: "25,970",
    png: UilUsdSquare,
    series: [
      {
        name: "",
        data: [31, 40, 28, 51, 42, 109, 100],
      },
    ],
  },
  {
    title: "",
    color: {
      backGround: "linear-gradient(180deg, #FF919D 0%, #FC929D 100%)",
      boxShadow: "0px 10px 20px 0px #FDC0C7",
    },
    barValue: 80,
    value: "14,270",
    png: UilMoneyWithdrawal,
    series: [
      {
        name: "Revenue",
        data: [10, 100, 50, 70, 80, 30, 40],
      },
    ],
  },
 
];

// Recent Update Card Data
export const UpdatesData = [
  {
    // img: img1,
    name: "Andrew Thomas",
  
    time: "25 seconds ago",
  },
  {
    // img: img2,
    name: "James Bond",
    time: "30 minutes ago",
  },
  {
    // img: img3,
    name: "Iron Man",
    time: "2 hours ago",
  },
];
