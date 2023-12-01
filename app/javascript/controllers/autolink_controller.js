import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autolink"
export default class extends Controller {
  static targets = ["link"]

  connect() {
    const delayInMillis = 10000;
    setTimeout(() =>this.formTarget.submit(), delayInMillis);
  }
}
