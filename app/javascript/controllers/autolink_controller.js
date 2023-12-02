import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autolink"
export default class extends Controller {
  static targets = ["link", "link_two"]

  connect() {
    const delayInMillis = 15000;
    setTimeout(() =>this.linkTarget.click(), delayInMillis);
    setTimeout(() =>this.link_twoTarget.click(), delayInMillis);
  }
}
