import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autolink"
export default class extends Controller {
  static targets = ["link", "link_two", "link_three"]

  connect() {
    console.log(this.link_threeTarget);
    const delayInMillis = 5000;
    const delayInMillis_two = 5000;
    setTimeout(() =>this.linkTarget.click(), delayInMillis);
    setTimeout(() =>this.link_twoTarget.click(), delayInMillis);
    setTimeout(() =>this.link_threeTarget.click(), delayInMillis_two);
  }
}
