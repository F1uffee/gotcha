import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wait-message"
export default class extends Controller {
  static targets = ["wait"]

  connect() {
    console.log("kinderpingui");
    console.log(this.waitTarget);
  }

  deco(){
    this.waitTarget.innerHTML ="En attente des autres joueurs..."
  }

}
