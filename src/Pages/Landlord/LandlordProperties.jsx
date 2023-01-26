import { useContext, useEffect, useState } from "react";
import UserContext from "../../Context/UserContext";

import { Container } from "react-bootstrap";
import {Table} from "react-bootstrap";
import { useNavigate } from "react-router-dom";



function LandlordProperties() {
    
    const user = useContext(UserContext);
    let navigate = useNavigate();

    const [rows, setRows] = useState([]);
    const [isLoading, setIsLoading] = useState(true);

    function pushToSingleProperty(propertyId){
        navigate(`/landlord/properties/${propertyId}`)
    }

    useEffect(() => {
        async function fetchAllProperties() {
            setIsLoading(false);
            await fetch(`http://localhost:10110/landlord/landlordproperties/${user.user.OIB}`, {
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
        if(isLoading) fetchAllProperties();
    })

    return (
        <Container>
            <h1>MY PROPERTIES</h1>
            <h3>Free Available Property</h3>
            <Table striped bordered hover>
                <thead>
                    <tr>
                    <th>Property name</th>
                    <th>Description</th>
                    <th>Property type</th>
                    <th>Property size</th>
                    <th>Country</th>
                    <th>Town</th>
                    <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    {rows.map((property) => {
                        if(property.status === 'free')
                        return (
                            
                            <tr key={property.property_id}>
                                <td>{property.property_name}</td>
                                <td>{property.description}</td>
                                <td>{property.property_type}</td>
                                <td>{property.property_size}</td>
                                <td>{property.country_name}</td>
                                <td>{property.town_name}</td>
                                <td>{property.street_name + " " + property.house_number}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
            <h3>Leased property</h3>
            <Table striped bordered hover>
                <thead>
                    <tr>
                    <th>Property name</th>
                    <th>Description</th>
                    <th>Property type</th>
                    <th>Property size</th>
                    <th>Country</th>
                    <th>Town</th>
                    <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    {rows.map((property) => {
                        if(property.status !== 'free')
                        return (
                            <tr key={property.property_id}>
                                <td>{property.property_name}</td>
                                <td>{property.description}</td>
                                <td>{property.property_type}</td>
                                <td>{property.property_size}</td>
                                <td>{property.country_name}</td>
                                <td>{property.town_name}</td>
                                <td>{property.street_name + " " + property.house_number}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </Table>
        </Container>
    )    


}

export default LandlordProperties;