import React from "react";
import ReactDOM from "react-dom";
import { ApolloClient } from "apollo-client";
import { InMemoryCache } from "apollo-cache-inmemory";
import { HttpLink } from "apollo-link-http";
import { ApolloProvider } from "react-apollo";
import "bootstrap/dist/css/bootstrap.min.css";

import "./index.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";

const { protocol, hostname } = document.location;
const uri = `${protocol}//${hostname}:3000/graphql`;
console.log(uri);
const cache = new InMemoryCache();
const link = new HttpLink({ uri });
const client = new ApolloClient({
  cache,
  link
});

ReactDOM.render(
  <ApolloProvider client={client}>
    <App />
  </ApolloProvider>,
  document.getElementById("root")
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
