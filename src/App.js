import { BrowserRouter } from "react-router-dom";
import RenderRoute from "./Routes/RenderRoute";
import Header from "./Layouts/Header";

import UserContext from "./Context/UserContext";
import { useState } from "react";


function App() {
  const [user, setUser] = useState("");


  return (
    <UserContext.Provider value={{user, setUser}}>
        <BrowserRouter>
          <Header /> 
          <RenderRoute />
        </BrowserRouter>
    </UserContext.Provider>
  );
}

export default App;
