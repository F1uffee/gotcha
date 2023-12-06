import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote-form"
export default class extends Controller {
  static targets = ["decorableElement"]


  submitForm(){
    this.element.submit()
  }
}
