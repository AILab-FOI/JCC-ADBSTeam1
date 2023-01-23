import { configureStore } from "@reduxjs/toolkit";

import UserContext from "../Context/UserContext";

export default configureStore(
    {
        reducer: {
            user: UserContext
        }
    }
);