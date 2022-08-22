// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "datatables.net-bs5";
import css from "../stylesheets/application.scss";
import "../components";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
window.bootstrap = require("bootstrap");
global.toastr = require("toastr");

const sheet = new CSSStyleSheet();
sheet.replaceSync(css.toString());
document.adoptedStyleSheets = [...document.adoptedStyleSheets, sheet];
