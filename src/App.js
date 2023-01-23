import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import UserTypes from "./Classes/Enums/UserTypes";
import User from "./Classes/User";
import { setUser, logoutUser } from "./Context/UserContext";

function App() {

  const user = useSelector(state => state.user.value);
  const dispatch = useDispatch();
  
  useEffect(() => {
    console.log(user);
  });

  const testUser = new User("1", "Marko", "Tester", UserTypes.LANDLORD);

  return (
    <div>
      <h1 onClick={() => {dispatch(setUser(JSON.stringify(testUser)))}}>Hello world</h1>
      <p onClick={() => {
        dispatch(logoutUser());
      }}>LogOut user</p>
    </div>
  );
}

export default App;
