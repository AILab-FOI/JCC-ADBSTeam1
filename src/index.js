import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import App from './App';

import { Provider } from 'react-redux';
import store from "./Utils/ReduxStore";

import Header from './Layouts/Header';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Provider store={store}>
      <Header />
      <App />
    </Provider>
  </React.StrictMode>
);

