import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  connect() {

  }

  async captureClick(event) {
    this.clickedController = this.linkTarget == event.target;
  }

  async hide(event) {
    if (this.clickedController) {
      this.clickedController = false;
      if (this.delete) {
        this.element.style = "display: none;";
        document.addEventListener(
          "turbo:before-fetch-response",
          this.handleResponse.bind(this)
        );
      } else {
        this.oldMessage = this.linkTarget.innerHTML;
        this.linkTarget.innerHTML = this.messageValue;
        this.delete = true;
        event.preventDefault();
        return false;
      }
    }
  }
}

// import Notification from 'stimulus-notification'

// export default class extends Notification {
//   connect() {
//     super.connect()
//     console.log('Do what you want here.')
//   }
// }
