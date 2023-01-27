import {Container, Table, Button} from "react-bootstrap";
import {useEffect, useState} from "react";
import { useParams } from "react-router-dom";
import { getDateString } from "../../Utils/DateHelper";

function LeasedProperty() {
    let { propertyId } = useParams();
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
                console.log(json);
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
        </Container>
    )

}

export default LeasedProperty;