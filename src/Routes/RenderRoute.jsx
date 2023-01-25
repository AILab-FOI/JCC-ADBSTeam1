import {Route, Routes} from "react-router-dom";
import Login from "../Pages/Login";
import Contracts from "../Pages/Tenant/Contracts";
import Properties from "../Pages/Tenant/Properties";
import SingleProperty from "../Pages/Tenant/SingleProperty";

function RenderRoute() {
    return (
        <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/tenant/properties" element={<Properties />} />
            <Route path="/tenant/properties/:propertyId" element={<SingleProperty />} />
            <Route path="/tenant/contracts/" element={<Contracts />} />
            <Route path="/tenant/utilities/" element={<Contracts />} />
        </Routes>
    )

}

export default RenderRoute;