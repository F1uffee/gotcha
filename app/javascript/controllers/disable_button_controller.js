import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-button"
export default class extends Controller {
  static targets = ["proposalBtn", "paragraph", "form"]

  connect() {
    console.log("kinderpingui");
    console.log(this.proposalBtnTarget);
    console.log(this.paragraphTarget);
  }

  replace(event) {
    event.preventDefault();
    this.proposalBtnTarget.classList.add("d-none");
    this.paragraphTarget.innerHTML ="En attente des autres joueurs";
    this.formTarget.submit();
  }
}
