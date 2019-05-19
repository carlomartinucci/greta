import React, { useState, useRef } from "react";
import FullCalendar from "@fullcalendar/react";
import dayGridPlugin from "@fullcalendar/daygrid";
import itLocale from "@fullcalendar/core/locales/it";
import interactionPlugin from "@fullcalendar/interaction";
import { Container, FormGroup, Label, Row, Col } from "reactstrap";
import GenericModal from "./GenericModal";
import useToggleState from "../hooks/useToggleState";
import useAutocomplete from "../hooks/useAutocomplete";
// import useShopping from "../hooks/useShopping";
import useLoadShoppingOptions from "../hooks/useLoadShoppingOptions";
import "../styles/calendar.scss";
import { formatDate } from "../utils/dayjs";
import Autocomplete from "./Autocomplete";
import { ApolloConsumer } from "react-apollo";

const header = {
  left: "title",
  center: "",
  right: "prev,next"
};
const plugins = [dayGridPlugin, interactionPlugin];

const Shopping = props => {
  const calendarRef = useRef(null);
  // const { shopping } = useShopping();
  const [isModalOpen, toggleIsModalOpen] = useToggleState(false);
  const [modalDate, setModalDate] = useState(null);
  const [options, setOptions] = useLoadShoppingOptions(props.client);

  const [breakfasts, setBreakfasts] = useState({});
  const handleBreakfast = breakfast => {
    setBreakfasts(breakfasts => ({
      ...breakfasts,
      [modalDate]: breakfast
    }));
  };

  const [lunchs, setLunchs] = useState({});
  const handleLunch = lunch => {
    setLunchs(lunchs => ({
      ...lunchs,
      [modalDate]: lunch
    }));
  };

  const [dinners, setDinners] = useState({});
  const handleDinner = dinner => {
    setDinners(dinners => ({
      ...dinners,
      [modalDate]: dinner
    }));
  };

  const loadDialog = dateEvent => {
    setModalDate(dateEvent.date);
    toggleIsModalOpen();
  };

  const saveModalAndClose = () => {
    const calendarApi = calendarRef.current && calendarRef.current.getApi();
    if (calendarApi) {
      const breakfastCount = breakfasts[modalDate]
        ? breakfasts[modalDate].length
        : 0;
      const lunchCount = lunchs[modalDate] ? lunchs[modalDate].length : 0;
      const dinnerCount = dinners[modalDate] ? dinners[modalDate].length : 0;
      toggleIsModalOpen();
      const oldEvent = calendarApi.getEventById(modalDate);
      if (oldEvent) {
        oldEvent.remove();
      }
      calendarApi.addEvent({
        id: modalDate,
        start: modalDate,
        allDay: true,
        title: `${breakfastCount} ${lunchCount} ${dinnerCount}`
      });
    }
  };

  return (
    <Container>
      <FullCalendar
        ref={calendarRef}
        defaultView="dayGridMonth"
        header={header}
        plugins={plugins}
        locale={itLocale}
        contentHeight="auto"
        dateClick={loadDialog}
        events={[]}
      />
      <Row>
        <Col xs="12">
          <h3>Colazione</h3>
          {Object.entries(breakfasts).map(([date, values]) => (
            <p>
              {formatDate(date)}: {values.map(value => value.label).join(", ")}
            </p>
          ))}
        </Col>
        <Col xs="12">
          <h3>Pranzo</h3>
          {Object.entries(lunchs).map(([date, values]) => (
            <p>
              {formatDate(date)}: {values.map(value => value.label).join(", ")}
            </p>
          ))}
        </Col>
        <Col xs="12">
          <h3>Cena</h3>
          {Object.entries(dinners).map(([date, values]) => (
            <p>
              {formatDate(date)}: {values.map(value => value.label).join(", ")}
            </p>
          ))}
        </Col>
      </Row>
      <ShoppingModal
        key={modalDate}
        isOpen={isModalOpen}
        toggle={saveModalAndClose}
        title={formatDate(modalDate)}
        options={options}
        setOptions={setOptions}
        breakfast={breakfasts[modalDate]}
        setBreakfast={handleBreakfast}
        lunch={lunchs[modalDate]}
        setLunch={handleLunch}
        dinner={dinners[modalDate]}
        setDinner={handleDinner}
      />
    </Container>
  );
};

const ShoppingModal = ({
  options,
  setOptions,
  breakfast,
  setBreakfast,
  lunch,
  setLunch,
  dinner,
  setDinner,
  ...modalProps
}) => {
  const breakfastProps = useAutocomplete(
    options,
    setOptions,
    breakfast,
    setBreakfast
  );
  const lunchProps = useAutocomplete(options, setOptions, lunch, setLunch);
  const dinnerProps = useAutocomplete(options, setOptions, dinner, setDinner);
  return (
    <GenericModal {...modalProps}>
      <FormGroup>
        <Label for="colazione">Colazione</Label>
        <Autocomplete name="colazione" {...breakfastProps} />
      </FormGroup>
      <FormGroup>
        <Label for="pranzo">Pranzo</Label>
        <Autocomplete name="pranzo" {...lunchProps} />
      </FormGroup>
      <FormGroup>
        <Label for="cena">Cena</Label>
        <Autocomplete name="cena" {...dinnerProps} />
      </FormGroup>
    </GenericModal>
  );
};

const ShoppingWithApolloClient = props => (
  <ApolloConsumer>
    {client => <Shopping client={client} {...props} />}
  </ApolloConsumer>
);
export default ShoppingWithApolloClient;
