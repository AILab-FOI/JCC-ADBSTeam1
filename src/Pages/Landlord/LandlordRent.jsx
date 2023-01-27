import { useContext, useEffect, useState } from "react";
import UserContext from "../../Context/UserContext";
import { useParams } from "react-router-dom";
import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";

import { getDateString } from "../../Utils/DateHelper";


function LandlordRent() {

    const user = useContext(UserContext);

    const [rows, setRows] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchAllRent() {
            setIsLoading(false);
            await fetch(`http://localhost:10110/landlord/rents/${user.user.OIB}`, {
                    method: "GET",
                    cache: "no-cache",
                    headers: {
                        'Content-type': 'application/json',
                        Accept: 'application.json' 
                    },
                }).then(res => res.json())
                .then(json => {
                    setRows(json);
                });
        }
        if(isLoading) fetchAllRent();
    })

    return (
        <Container>
            <h1>RENTS REPORTS FOR MY PROPERTIES</h1>
            <Table striped bordered hover>
                <thead>
                    <tr>
                    <th>Property name </th>
                    <th>Rent due date </th>
                    <th>Rent paid</th>
                    </tr>
                </thead>
                <tbody>
                    {rows.map((rent) => {
                        return (
                            <tr key={rent.contract_id}>
                                <td>{rent.property_name}</td>
                                <td>{getDateString(rent.rent_due_date)}</td>
                                <td>{rent.rent_rate}€</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
        </Container>
    )    


}

export default LandlordRent;