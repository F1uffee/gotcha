import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote-form"
export default class extends Controller {
  static targets = ["decorableElement"]


  connect() {
    console.log("coucou")
  }

  submitForm(){
    this.element.submit()
  }
}
