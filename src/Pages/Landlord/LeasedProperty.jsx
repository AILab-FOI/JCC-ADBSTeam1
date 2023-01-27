import {Container, Table, Button, FormLabel, Form} from "react-bootstrap";
import {useEffect, useState} from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getDateString } from "../../Utils/DateHelper";
import { features } from "../../Utils/GetFeatures";

function LeasedProperty() {
    let { propertyId } = useParams();
    let navigate = useNavigate();
    function downloadHistory() {
        const JSONstring = `data:text/json;charset=utf-8,${encodeURIComponent(
            JSON.stringify(history)
        )}`;
        const link = document.createElement("a");
        link.href = JSONstring;
        link.download = "history.json";

        link.click();
    }

    const [history, setHistory] = useState();
    const [isLoading, setIsLoading] = useState(true);
    const [mainten, setMainten] = useState([]);
    const [feat, setFeat] = useState();
    const [value, setValue] = useState();

    async function handleClick(e) {
        e.preventDefault();
        const reqBody = {
            feat: e.target.form[0].value,
            value: e.target.form[1].value,
            property: propertyId
        }

        await fetch(`http://localhost:10110/feat/update`, {
            method: "POST",
            cache: "no-cache",
            headers: {
                'Content-type': 'application/json',
                Accept: 'application.json' 
            },
            body: JSON.stringify(reqBody)
        }).then(res => res.json())
        .then(json => {
            navigate("/landlord/properties")
        });
    }

    useEffect(() => {
        async function getAllData() {
            await fetch(`http://localhost:10110/landlord/property/history/${propertyId}`, {
                method: "GET",
                cache: "no-cache",
                headers: {
                    'Content-type': 'application/json',
                    Accept: 'application.json' 
                },
            }).then(res => res.json())
            .then(json => {
                setHistory(json);
            });

            await fetch(`http://localhost:10110/landlord/property/maintenance/${propertyId}`, {
                method: "GET",
                cache: "no-cache",
                headers: {
                    'Content-type': 'application/json',
                    Accept: 'application.json' 
                },
            }).then(res => res.json())
            .then(json => {
                setMainten(JSON.parse(json));
            });

            setIsLoading(false);
        }
        if(isLoading === true) {
           getAllData();
        }
    })

    return (
        <Container>
            <h1>My leased property</h1>
            <h3>History data</h3>
            <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>Document type</th>
                        <th>Click to download!</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>History</td>
                        <td>
                            <Button onClick={downloadHistory}>Download</Button>
                        </td>
                    </tr>
                </tbody>
            </Table>
            <h3>Maintenance</h3>

            { mainten.length !== 0 && <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>Maintenance date</th>
                        <th>Maintenance type</th>
                    </tr>
                </thead>
                <tbody>
                   {mainten.map((value, index) => {
                    return (
                        <tr key={index}>
                            <td>{getDateString(value.maintenance_date)}</td>
                            <td>{value.maintenance_type_name}</td>
                        </tr>
                    )
                   })}
                </tbody>
            </Table>}

            <h4>
                UPDATE FEATURE
            </h4>
            <Container>
                <Form>
                    <Form.Select>
                        {
                            features.map((feat, index) => {
                                return (
                                    <option id="optionForFeat" key={index} value={feat.value}>{feat.name}</option>
                                )
                            })
                        }
                    </Form.Select>
                    <Form.Group className="mb-3" controlId="formInput">
                        <Form.Label>Enter new value</Form.Label>
                        <Form.Control name="feat"  placeholder="Enter new value"/>
                    </Form.Group>
                    <Button type="submit" onClick={handleClick}>Update feature</Button>
                </Form>
            </Container>
        </Container>
    )

}

export default LeasedProperty;