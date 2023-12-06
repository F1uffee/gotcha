import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alerts"
export default class extends Controller {
  static targets = ["alert"]
  connect() {
    // Ferme l'alerte après qq secondes
    const delayInMillis = 2000;
    setTimeout(() =>this.alertTarget.classList.add("d-none"), delayInMillis);
  }
}
