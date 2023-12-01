import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-automatic"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    const delayInMillis = 5000;
    setTimeout(() =>this.formTarget.submit(), delayInMillis);
  }
}
