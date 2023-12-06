import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote-form"
export default class extends Controller {

  submitForm(){
    this.element.submit()
  }
}
