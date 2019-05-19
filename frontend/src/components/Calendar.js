import React from "react";
import FullCalendar from "@fullcalendar/react";
import dayGridPlugin from "@fullcalendar/daygrid";
import listPlugin from "@fullcalendar/list";
import itLocale from "@fullcalendar/core/locales/it";
import interactionPlugin from "@fullcalendar/interaction";
import bootstrapPlugin from "@fullcalendar/bootstrap";
import { Container, Row, Col } from "reactstrap";

import "../styles/calendar.scss";

const header = {
  left: "title",
  center: "",
  right: "listMonth,dayGridMonth prev,next"
};
const customButtons = {
  info: {
    text: "?",
    click() {
      alert("info shown!");
    }
  }
};
const plugins = [bootstrapPlugin, dayGridPlugin, listPlugin, interactionPlugin];
const eventFactory = ({ title, hour, color }) =>
  [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ].map(day => ({
    id: `${title}${day}`,
    title,
    start: `2019-05-${day} ${hour}:00`,
    color
  }));

const events = eventFactory({ title: "c", hour: "06", color: "red" }).concat(
  eventFactory({ title: "p", hour: "12", color: "green" }),
  eventFactory({ title: "m", hour: "16", color: "purple" }),
  eventFactory({ title: "c", hour: "20", color: "orange" })
);

const gEvents = [
  {
    id: 1,
    title: "Cereali",
    groupId: "colazione",
    start: "2019-05-15"
  },
  {
    id: 2,
    title: "Latte",
    groupId: "colazione",
    start: "2019-05-15"
  },
  {
    id: 3,
    title: "Marmellata",
    groupId: "colazione",
    start: "2019-05-15"
  },
  {
    id: 4,
    title: "Riso",
    groupId: "pranzo",
    start: "2019-05-15"
  },
  {
    id: 5,
    title: "Pomodoro",
    groupId: "pranzo",
    start: "2019-05-15"
  }
];

const eventClick = info => {
  console.log(info.event);
};

const Calendar = props => (
  <Container fluid>
    <FullCalendar
      defaultView="dayGridMonth"
      themeSystem="bootstrap"
      header={header}
      plugins={plugins}
      locale={itLocale}
      contentHeight="auto"
      dateClick={console.log}
      events={events}
      eventClick={eventClick}
      customButtons={customButtons}
    />
  </Container>
);

export default Calendar;
