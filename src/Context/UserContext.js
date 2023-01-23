import { createSlice } from "@reduxjs/toolkit";


function saveUserInSession(userObjectAsString){
    console.log(userObjectAsString);
    sessionStorage.setItem("user", userObjectAsString);
}

function getUserFromSession(){
    return sessionStorage.getItem("user");
}

function removeUserFromSession(){
    return sessionStorage.removeItem("user");
}

/**
 * @name -> provides identification value for state
 * @initialState -> provides initial state value on load
 * @reducers -> functions that can update state
 * @actions -> connects possible actions with functions
 */
export const userSlice = createSlice({
    name: "user",
    initialState: {
        value: getUserFromSession()
    },
    reducers: {
        setUser: (user, action) => {
            saveUserInSession(action.payload);
            user.value = sessionStorage.getItem("user");
        },
        logoutUser: (user) => {
            removeUserFromSession();
            user.value = null;
        }
    }
});

export const { setUser, logoutUser } = userSlice.actions;

export default userSlice.reducer;