import { useContext, useEffect, useState } from "react";
import UserContext from "../../Context/UserContext";
import { useParams } from "react-router-dom";
import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";


function Utilities() {

    let { contractID } = useParams();

    const [rows, setRows] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchAllUtilities() {
            setIsLoading(false);
            await fetch(`http://localhost:10110/tenant/utilities/${contractID}`, {
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
                    <th>amount_to_pay</th>
                    <th>utility_due_date </th>
                    <th> utility_paid</th>
                    <th>utility_type_name</th>
                    </tr>
                </thead>
                <tbody>
                    {rows.map((utilities, index) => {
                        return (
                            <tr key={utilities.contract_id}>
                                <td>{index + 1 }</td>
                                <td>{utilities.amount_to_pay}</td>
                                <td>{utilities.utility_due_date}</td>
                                <td>{utilities.utility_paid}</td>
                                <td>{utilities.utility_type_name}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
        </Container>
    )    


}

export default Utilities;