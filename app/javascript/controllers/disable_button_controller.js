import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-button"
export default class extends Controller {
  static targets = ["proposalBtn", "paragraph", "form"]

  replace() {
    if (this.hasFormTarget) {
      this.proposalBtnTarget.classList.add("d-none");
      this.paragraphTarget.innerHTML = "En attente des autres joueurs...";
    }
  }
}
