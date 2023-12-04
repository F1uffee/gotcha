import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote-form"
export default class extends Controller {

  connect() {
    console.log("coucou")
  }

  submitForm(){
    this.element.submit()
  }
}
