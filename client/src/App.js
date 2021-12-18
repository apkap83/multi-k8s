import "./App.css";
import React from "react";
import { Route, Switch, Link } from "react-router-dom";
import OtherPage from "./OtherPage";
import Fib from "./Fib";

function App() {
  return (
    <React.Fragment>
      <main className="App">
        <Switch>
          <Route
            path="/"
            exact
            render={() => (
              <div>
                <Link to="/fib">Fib - Version 2</Link>
                <br />
                <Link to="/otherpage">Other Page</Link>
              </div>
            )}
          />
          <Route path="/fib" component={Fib} />
          <Route path="/otherpage" component={OtherPage} />
        </Switch>
      </main>
    </React.Fragment>
  );
}

export default App;
