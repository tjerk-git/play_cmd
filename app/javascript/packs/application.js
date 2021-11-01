import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "stylesheets/application"
import "@hotwired/turbo-rails"

// TODO: REMOVE FOLLOWING
import './components/confetti'
import './components/syntax-highlight'


require("trix")
require("@rails/actiontext")

Rails.start()
Turbolinks.start()
ActiveStorage.start()


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
import "controllers"
