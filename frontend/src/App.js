import React, { Suspense, lazy } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Loading from "./components/Loading";
import TopNavBar from "./components/TopNavBar";

import "./App.css";

const Goods = lazy(() => import("./components/Goods"));
const Calendar = lazy(() => import("./components/Calendar"));
const Shopping = lazy(() => import("./components/Shopping"));

const App = () => (
  <Router>
    <div className="App">
      <TopNavBar />
      <Suspense fallback={<Loading />}>
        <Switch>
          <Route exact path="/" component={Goods} />
          <Route exact path="/calendar" component={Calendar} />
          <Route exact path="/shopping" component={Shopping} />
        </Switch>
      </Suspense>
    </div>
  </Router>
);

export default App;
