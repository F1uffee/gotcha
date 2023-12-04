import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log('Do what you want here.')
  }

  // Function to override on copy.
  copy(event) {
    this.inputTarget.value;
    document.execCommand('copy');

    try {
      navigator.clipboard.writeText(this.inputTarget.value)
        .then(() => {
          event.currentTarget.disabled = true;
          event.currentTarget.innerText = this.feedbackTextValue;
        })
        .catch(err => {
          console.error('Unable to copy to clipboard', err);
        });
    } catch (err) {
      console.error('Clipboard API not supported', err);
    }
  }

  // Function to override when to input is copied.
  copied() {
    //
  }
}
