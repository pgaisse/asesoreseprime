import React from "react";
import { createBrowserRouter } from "react-router-dom";
import Layout from "./Layout"
import ErrorDetail from "@/Hooks/Errors/ErrorDetail";
import Home from "./Home";
import AuthorizedUsers from "@/Hooks/Access/AuthorizedUsers";
import Profile from "./Profile";
import SignIn from "./SignIn";
import Cases from "./Cases";
import Logout from "./Logout";
import Clients from "./Clients";
import Advisers from "./Advisers";
import paths from "@/paths/paths";
import MyCases from "./MyCases";



type Props = {};


const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    errorElement:
      <Layout>
        <ErrorDetail />
      </Layout>,
    children: [
      { index: true, element: <Home /> },

      {
        path: paths.signin,
        element: <AuthorizedUsers reqAuth={false} />,
        children: [
          { path: "", element: <SignIn /> },
        ],
      },


      {
        path: paths.profile,
        element: <AuthorizedUsers reqAuth={true} />,
        children: [
          { path: "", element: <Profile /> },
        ],
      },
      {
        path: paths.cases,
        element: <AuthorizedUsers reqAuth={true} />,
        children: [
          { path: "", element: <Cases /> },


        ],
      },
      {
        path: paths.clients,
        element: <AuthorizedUsers reqAuth={true} />,
        children: [
          { path: "", element: <Clients /> },


        ],
      },

      {
        path: paths.advisers,
        element: <AuthorizedUsers reqAuth={true} />,
        children: [
          { path: "", element: <Advisers /> },


        ],
      },

      {
        path: paths.logout,
        element: <AuthorizedUsers reqAuth={false} />,
        children: [
          { path: "", element: <Logout /> },
        ],
      },
      {
        path: paths.myCases,
        element: <AuthorizedUsers reqAuth={false} />,
        children: [
          { path: "", element: <MyCases /> },
        ],
      },

    ],
  },
]);
export default router;
