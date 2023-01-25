/* eslint-disable array-callback-return */
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";


function Utilities() {

    let { contractID } = useParams();

    const [rows, setRows] = useState([]);
    const [rows2, setRows2] = useState([]);
    const [document, setDocument] = useState();

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
                await fetch(`http://localhost:10110/tenant/security/${contractID}`, {
                    method: "GET",
                    cache: "no-cache",
                    headers: {
                        'Content-type': 'application/json',
                        Accept: 'application.json' 
                    },
                }).then(res => res.json())
                .then(json => {
                    setRows2(json);
                });
                await fetch(`http://localhost:10110/tenant/contracts/document/${contractID}`, {
                    method: "GET",
                    cache: "no-cache",
                    headers: {
                        'Content-type': 'application/json',
                        Accept: 'application.json' 
                    },
                    }).then(res => res.json())
                    .then(json => {
                        setDocument(json.contract_document);
                    });
        }
  
        if(isLoading){ 
            fetchAllUtilities()
        };
    })
    if(isLoading === false){

        return (
            <Container>
                 <h1>CONTRACT INFORMATION</h1>
                <h3>UNPAID</h3>
                <Table striped bordered hover>
                    <thead>
                        <tr>
                        <th>Amount to pay</th>
                        <th>Utility due date </th>
                        <th>Utility type</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows.map((utilities) => {
                            if(utilities.utility_paid === '0')
                            return (
                                <tr key={utilities.contract_id}>
                                    <td>{utilities.amount_to_pay}€</td>
                                    <td>{utilities.utility_due_date}</td>
                                    <td>{utilities.utility_type_name}</td>
                                </tr>
                            )
                        })}
                    </tbody>
                </Table>
                <h3>PAID</h3>
                <Table striped bordered hover>
                    <thead>
                        <tr>
                        <th>Amount paid</th>
                        <th>Utility due date </th>
                        <th>Utility type</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows.map((utilities) => {
                            if(utilities.utility_paid === '1')
                            return (
                                <tr key={utilities.contract_id}>
                                    <td>{utilities.amount_to_pay}€</td>
                                    <td>{utilities.utility_due_date}</td>
                                    <td>{utilities.utility_type_name}</td>
                                </tr>
                            )
                        })}
                    </tbody>
                </Table>
    
                <h3>Security deposit</h3>
                <Table striped bordered hover>
                    <thead>
                        <tr>
                        <th>#</th>
                        <th>Paid</th>
                        <th>Used</th>
                        <th>Left</th>
                        <th>Used for</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rows2.map((security, index) => {
                            return (
                                <tr  key={security.amount_paid}>
                                    <td>{index + 1 }</td>
                                    <td>{security.amount_paid}€</td>
                                    <td>{security.amount_used}€</td>
                                    <td>{security.amount_paid - security.amount_used}€</td>
                                    
                                </tr>
                            )
                        })}
                    </tbody>
                </Table>
                <h3>Contract review</h3> 
                <Container style={{height: '500px', width:'85%'}} className="d-flex justify-content-center">
                    <embed style={{width: '100%'}} type="application/pdf" src={`data:application/pdf;base64,${document}`} />     
                </Container>
            </Container>
        )    
    }else{
        return(
            <Container>
                loading
            </Container>
        )
    }



}

export default Utilities;