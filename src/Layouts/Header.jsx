import { useEffect } from 'react';

import { NavDropdown } from 'react-bootstrap';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';

import { Avatar } from '@mui/material';

import { useSelector, useDispatch } from 'react-redux';
import { logoutUser } from '../Context/UserContext';
import User from '../Classes/User';


const styles = {
    navbar: {
        "display": "flex",
        "justifyContent": "space-between"
    },
};

function Header() {

  const user = useSelector(state => state.user.value);
  const dispatch = useDispatch();

    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container>
                    <Navbar.Brand>
                        JCC-Team1
                    </Navbar.Brand>
                    <div style={styles.navbar}>
                        <Nav className="me-auto">
                            <Nav.Link>Home</Nav.Link>
                            <NavDropdown title="Properties" id="properties-nav-dropdown">
                                <NavDropdown.Item>
                                    My Properties
                                </NavDropdown.Item>
                                <NavDropdown.Item>
                                    Tenants
                                </NavDropdown.Item>
                            </NavDropdown>
                            <Nav.Link>
                                Pending Offers
                            </Nav.Link>
                            <Nav.Link>
                                Utilities
                            </Nav.Link>
                        </Nav>
                        <Nav className="ms-5 me-auto">
                            <Nav.Link>
                                <div style={styles.navbar}>
                                    <Avatar className="me-3" />
                                    <p>{User.parseJSON(user).first_name + " " + User.parseJSON(user).last_name}</p>
                                </div>                                
                            </Nav.Link>
                            <Nav.Link onClick={() => dispatch(logoutUser())}>
                                Logout
                            </Nav.Link>
                        </Nav>
                    </div>
                </Container>
            </Navbar>
        </>
    )
}

export default Header;