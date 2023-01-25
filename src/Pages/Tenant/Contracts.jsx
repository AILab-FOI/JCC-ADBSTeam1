import { useContext, useEffect, useState } from "react";
import UserContext from "../../Context/UserContext";
import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";
import { useNavigate } from 'react-router-dom';

function Contracts() {
    const user = useContext(UserContext);

    const [rows, setRows] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchAllContracts() {
            setIsLoading(false);
            await fetch(`http://localhost:10110/tenant/contracts/${user.user.OIB}`, {
            //await fetch(`http://localhost:10110/tenant/contracts`, {
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
        if(isLoading) fetchAllContracts();
    })

    let navigate = useNavigate();

    function pushToUtilities(contractID) {
        navigate(`/tenant/utilities/${contractID}`);
    }

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
                    {rows.map((contract, index) => {
                        return (
                            <tr onClick={()=>pushToUtilities(contract.contract_id)} key={contract.contract_id}>
                                <td>{index + 1 }</td>
                                <td>{contract.check_in}</td>
                                <td>{contract.check_out}</td>
                                <td>{contract.rent_rate}€</td>
                                <td>{contract.contract_date}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
        </Container>
    )    


}

export default Contracts;