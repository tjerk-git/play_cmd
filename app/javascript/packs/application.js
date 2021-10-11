// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application"
import './components/confetti'
import './components/syntax-highlight'
import "@hotwired/turbo-rails"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")


let __SkipConfirmation = false;

Rails.confirm = function (message, element) {
  if (__SkipConfirmation) {
    return true;
  }
  function onConfirm() {
    __SkipConfirmation = true
    element.click()
    __SkipConfirmation = false
  }
  Swal.fire({
    title: message,
    showCancelButton: true,
    icon: 'warning',
    confirmButtonText: 'Yes, I am very sure!',
  }).then((result) => {
    if (result.isConfirmed) {
      onConfirm();
    }
  })
  return false;
};