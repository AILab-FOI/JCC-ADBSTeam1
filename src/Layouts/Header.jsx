import { NavDropdown } from 'react-bootstrap';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import UserContext from '../Context/UserContext';
import { useContext } from "react";
import { useNavigate } from 'react-router-dom';

import { Button } from 'react-bootstrap';

function Header() {

    const userState = useContext(UserContext);

    const customStyles = {
        navbar: {
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center"
        }
    }

    let navigate = useNavigate();

    function pushToLogin() {
        userState.setUser("");
        navigate("/login");
    }
    function pushToContract() {
        navigate("/tenant/contracts/");
    }
    function pushToRents() {
        navigate(`/tenant/rents/`);
    }
    function pushToProperties() {
        navigate(`/tenant/properties`)
    }
    function pushToPropertiesLandlord() {
        navigate(`/landlord/properties`)
    }
    function pushToRentsLandlord() {
        navigate(`/landlord/rents`)
    }
    function pushToUtilitiesLandlord(){
        navigate(`/landlord/utilities`)
    }


    if(userState.user === "") {
        return (
        <>
            <Navbar bg="light" expand="lg" className="mb-5">
                    <Container style={customStyles.navbar}>
                            <Navbar.Brand>
                                JCC-Team1
                            </Navbar.Brand>
                            <Nav>
                                <Button variant="primary" onClick={pushToLogin}>
                                    Login
                                </Button>
                            </Nav>
                    </Container>
                </Navbar>
            </>
        )
    } else if (userState.user.user_role_id === 3) {
        return (
            <>
                <Navbar bg="light" expand="lg" className="mb-5">
                    <Container>
                        <Navbar.Brand>
                            JCC-Team1
                        </Navbar.Brand>
                        <div style={customStyles.navbar}>
                            <Nav className="me-auto">
                                <Nav.Link>TENANT</Nav.Link>
                                <NavDropdown title="My leases" id="leases-nav-dropdown">
                                    <NavDropdown.Item
                                    onClick={pushToContract}>
                                        Contracts
                                    </NavDropdown.Item>
                                    <NavDropdown.Item
                                    onClick={pushToRents}>
                                        Rent reports
                                    </NavDropdown.Item>
                                </NavDropdown>
                                <Nav.Link onClick={pushToProperties}>
                                    Available properties
                                </Nav.Link>
                            </Nav>
                            <Nav className="ms-5 me-auto mt-3">
                                <Nav.Link>
                                    <div>
                                        <p>{userState.user.first_name + " " + userState.user.last_name}</p>
                                    </div>                                
                                </Nav.Link>
                                <Nav.Link onClick={pushToLogin}>
                                    Logout
                                </Nav.Link>
                            </Nav>
                        </div>
                    </Container>
                </Navbar>
            </>
        );
    } else if (userState.user.user_role_id === 2) {
        return (
            <>
                <Navbar bg="light" expand="lg" className="mb-5">
                    <Container>
                        <Navbar.Brand>
                            JCC-Team1
                        </Navbar.Brand>
                        <div style={customStyles.navbar}>
                            <Nav className="me-auto">
                                <Nav.Link>LANDLORD</Nav.Link>
                                <NavDropdown title="My Properties" id="properties-nav-dropdown">
                                    <NavDropdown.Item onClick={pushToPropertiesLandlord}>
                                        Free and Leased
                                    </NavDropdown.Item>
                                    <NavDropdown.Item onClick={pushToRentsLandlord}>
                                        Rent reports
                                    </NavDropdown.Item>
                                    <NavDropdown.Item onClick={pushToUtilitiesLandlord}>
                                        Utilities reports
                                    </NavDropdown.Item>
                                </NavDropdown>
                            </Nav>
                            <Nav className="ms-5 me-auto mt-3">
                                <Nav.Link>
                                    <div>
                                        <p>{userState.user.first_name + " " + userState.user.last_name}</p>
                                    </div>                                
                                </Nav.Link>
                                <Nav.Link onClick={pushToLogin}>
                                    Logout
                                </Nav.Link>
                            </Nav>
                        </div>
                    </Container>
                </Navbar>
            </>
        )
    }
}

export default Header;