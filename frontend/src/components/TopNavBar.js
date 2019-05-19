import React from "react";
import { Link } from "react-router-dom";
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem
} from "reactstrap";

import useToggleState from "../hooks/useToggleState";

const TopNavBar = props => {
  const [isOpen, toggleIsOpen] = useToggleState(false);
  return (
    <div>
      <Navbar color="light" light expand="md">
        <NavbarBrand tag={Link} to="/">
          Greta
        </NavbarBrand>

        <NavbarToggler onClick={toggleIsOpen} />
        <Collapse isOpen={isOpen} navbar>
          <Nav className="ml-auto" navbar>
            <NavItem>
              <NavLink tag={Link} to="/calendar" onClick={toggleIsOpen}>
                Calendar
              </NavLink>
            </NavItem>

            <NavItem>
              <NavLink tag={Link} to="/shopping" onClick={toggleIsOpen}>
                Shopping
              </NavLink>
            </NavItem>
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  );
};

export default TopNavBar;
