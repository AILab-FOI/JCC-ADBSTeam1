import UserContext from "../Context/UserContext";
import { useContext, useEffect, useState } from "react";

import { useNavigate } from "react-router-dom";
import { Button, Container, Form } from "react-bootstrap";


function Login() {

    const navigate = useNavigate();

    const userState = useContext(UserContext);

    const [oib, setOIB] = useState("");
    const [password, setPassword] = useState("");

    function handleInput(e) {
        e.preventDefault();
        if(e.target.name === "oibInput") {
            setOIB(e.target.value);
        } else {
            setPassword(e.target.value);
        }
    }

    useEffect(() => {
        if(userState.user !== ""){
            userState.user.user_role_id === 2 ? navigate("/landlord/properties") : navigate("/tenant/properties");
        }
    });

    const loginUser = async () => {
        fetch("http://localhost:10110/", {
            method: "POST",
            cache: "no-cache",
            headers: {
                'Content-type': 'application/json',
                Accept: 'application.json'
            },
            body: JSON.stringify({
                oib: oib,
                password: password
            })
        }).then(res => res.json())
        .then(json => {
            userState.setUser(json)
            console.log(json);
        });
    }

    return(
        <div>
            <Container>
                <Form>
                    <Form.Group className="mb-3" controlId="formEmail">
                        <Form.Label>OIB</Form.Label>
                        <Form.Control name="oibInput" placeholder="Enter OIB" onChange={handleInput} />
                        <Form.Text className="text-muted">
                            We will never share your OIB with anyone else.
                        </Form.Text>
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formPassword">
                        <Form.Label>Password</Form.Label>
                        <Form.Control name="passwordInput" type="password" placeholder="Enter password" onChange={handleInput} />
                    </Form.Group>

                    <Button variant="primary" onClick={() => loginUser()}>
                        Submit
                    </Button>
                </Form>
            </Container>
        </div>
    );

}

export default Login;