import {Route, Routes} from "react-router-dom";
import Login from "../Pages/Login";
import Contracts from "../Pages/Tenant/Contracts";
import Properties from "../Pages/Tenant/Properties";
import Rent from "../Pages/Tenant/Rent";
import SingleProperty from "../Pages/Tenant/SingleProperty";
import Utilities from "../Pages/Tenant/Utilities";

function RenderRoute() {
    return (
        <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/tenant/properties" element={<Properties />} />
            <Route path="/tenant/properties/:propertyId" element={<SingleProperty />} />
            <Route path="/tenant/contracts/" element={<Contracts />} />
            <Route path="/tenant/utilities/:contractID" element={<Utilities />} />
            <Route path="/tenant/rents/" element={<Rent />} />
        </Routes>
    )

}

export default RenderRoute;