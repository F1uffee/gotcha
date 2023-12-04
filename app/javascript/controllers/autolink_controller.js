import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autolink"
export default class extends Controller {
  static targets = ["link_two", "link_three"]

  connect() {
    // console.log(this.linkTarget);
    const delayInMillis = 10000;
    const delayInMillis_two = 20000;
    setTimeout(() =>this.linkTarget.click(), delayInMillis);
    setTimeout(() =>this.link_twoTarget.click(), delayInMillis);
    setTimeout(() =>this.link_threeTarget.click(), delayInMillis_two);
  }
}
