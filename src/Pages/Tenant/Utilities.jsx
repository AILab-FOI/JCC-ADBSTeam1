import { useContext, useEffect, useState } from "react";
import UserContext from "../../Context/UserContext";
import { useParams } from "react-router-dom";
import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";


function Utilities() {

    let { tenantOIB } = '01949600419';

    const [rows, setRows] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchAllUtilities() {
            setIsLoading(false);
            //await fetch(`http://localhost:10110/tenant/Utilities/${tenantOIB}`, {
            await fetch(`http://localhost:10110/tenant/utilities`, {
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
        if(isLoading) fetchAllUtilities();
    })

    return (
        <Container>
            <Table striped bordered hover>
                <thead>
                    <tr>
                    <th>#</th>
                    <th>Check in</th>
                    <th>Check out</th>
                    <th>Rent rate</th>
                    <th>Contract Date</th>
                    </tr>
                </thead>
                <tbody>
                    {rows.map((utilities, index) => {
                        return (
                            <tr key={utilities.contract_id}>
                                <td>{index + 1 }</td>
                                <td>{utilities.check_in}</td>
                                <td>{utilities.check_out}</td>
                                <td>{utilities.rent_rate}</td>
                                <td>{utilities.contract_date}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
        </Container>
    )    


}

export default Utilities;