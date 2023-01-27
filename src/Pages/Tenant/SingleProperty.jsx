import { Container, Card, ListGroup } from "react-bootstrap";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react"

function SingleProperty() {

    let { propertyId } = useParams();

    const [isLoading , setIsLoading] = useState(true);
    const [property, setProperty] = useState("");

    useEffect(() => {
        async function fetchPropertyData() {
            await fetch(`http://localhost:10110/tenant/properties/${propertyId}`, {
                method: "GET",
                cache: "no-cache",
                    headers: {
                        'Content-type': 'application/json',
                        Accept: 'application.json'
                    },
                }).then(res => res.json())
                .then(json => {
                    setProperty(JSON.parse(json));
                });
            setIsLoading(false);
        }

        if(isLoading) fetchPropertyData();
    })

    if(isLoading !== true) {
        console.log(property);
        return (
            <Container>
                <Card>
                    <Card.Img variant="top" />
                    <Card.Body>
                        <Card.Title>
                            {property.property_name}
                        </Card.Title>
                        <Card.Text>
                            <ListGroup>
                                <ListGroup.Item>{"Type: " + property.property_tpe_name}</ListGroup.Item>
                                <ListGroup.Item>{"Description: " + property.description}</ListGroup.Item>
                                <ListGroup.Item>{"Size: " + property.property_size}</ListGroup.Item>
                                <ListGroup.Item>{"Value: " + property.property_value}</ListGroup.Item>
                                <ListGroup.Item>{"Landlord: " + property.first_name + " " + property.last_name}</ListGroup.Item>
                                <ListGroup.Item>{"Email: " + property.email}</ListGroup.Item>
                                <ListGroup.Item>{"Phone number: " + property.phone_number}</ListGroup.Item>
                            </ListGroup>
                        </Card.Text>
                        <Card.Link onClick={(event) => {
                            window.location.href = `mailto:${property.email}`
                            event.preventDefaut();
                        }}>
                            Send request
                        </Card.Link>
                    </Card.Body>
                </Card>
            </Container>
        )
    } else {
        return (
            <Container>
                <p>Loading...</p>
            </Container>
        )
    }
}

export default SingleProperty;