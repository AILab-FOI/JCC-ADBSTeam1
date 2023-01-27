import { Container, Form, Button } from "react-bootstrap";
import { Navigate, useNavigate, useParams } from "react-router-dom";

function ContractInsert() {

    let { propertyId } =  useParams();
    let navigate = useNavigate();

    function convertToBase64(e) {
        const file = e.target.files[0];
        sessionStorage.removeItem("document");
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = (event) => {
            let doc = event.target.result.split(",")[1];
            sessionStorage.setItem("document", doc);
        }
    }


    async function submitContractForm(e){
        e.preventDefault();

    
        let doc = sessionStorage.getItem("document");

        const contractObject = {
            property_id: propertyId,
            tenant_oib: e.target.form[0].value,
            check_in: e.target.form[2].value,
            check_out: e.target.form[3].value,
            rent_rate: e.target.form[1].value,
            contract_document: doc
        };

        await fetch(`http://localhost:10110/landlord/add/contract`, {
            method: "POST",
            cache: "no-cache",
            headers: {
                'Content-type': 'application/json',
                Accept: 'application/json' 
            },
            body: JSON.stringify(contractObject)
        }).then(res => res.json())
        .then(json => {
            navigate("/landlord/properties")
        });
                
    }

    return (
        <Container>
            <h1>NEW CONTRACT AGREEMENT</h1>
            <Form>
                    <Form.Group className="mb-3" controlId="formTenantInput">
                        <Form.Label>Tenant OIB</Form.Label>
                        <Form.Control name="tenantInput" placeholder="Enter tenant OIB" maxLength={11} />
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formRentInput">
                        <Form.Label>Rent rate</Form.Label>
                        <Form.Control name="rentInput"  placeholder="Enter rent rate" type="number" />
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formCheckIn">
                        <Form.Label>Check In date</Form.Label>
                        <Form.Control name="checkIn"  placeholder="Enter check in date" type="date" />
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formCheckOut">
                        <Form.Label>Check Out date</Form.Label>
                        <Form.Control name="checkOut"  placeholder="Enter check out date" type="date" />
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formContractUpload">
                        <Form.Label>Contract upload</Form.Label>
                        <Form.Control name="contractFile"  placeholder="Upload contract" type="file" onChange={convertToBase64} accept="application/pdf"/>
                    </Form.Group>

                    <Button variant="primary" type="submit" onClick={submitContractForm}>
                        Enter contract
                    </Button>
                </Form>
        </Container>
    )
}

export default ContractInsert;