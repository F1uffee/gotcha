import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autolink"
export default class extends Controller {
  static targets = ["link","link_two", "link_three"]

  connect() {
    const delayInMillis = 7000;
    const delayInMillis_two = 20000;

    if (this.hasLinkTarget) {
      setTimeout(() =>this.linkTarget.click(), delayInMillis);
    }
    if (this.hasLink_twoTarget) {
      setTimeout(() =>this.link_twoTarget.click(), delayInMillis);
    }
    if (this.hasLink_threeTarget) {
      setTimeout(() =>this.link_threeTarget.click(), delayInMillis_two);
    }
  }
}
