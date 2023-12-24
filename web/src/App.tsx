import { RouterProvider, createBrowserRouter } from "react-router-dom";

import Fiber from "./components/Fiber";
import NotFound from "./components/NotFound";
import React from "./components/React";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Fiber />,
  },
  {
    path: "/",
    element: <React />,
  },
  {
    path: "*",
    element: <NotFound />,
  },
]);

const App = () => (
  <>
    <RouterProvider router={router} />
  </>
);

export default App;
