import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="howdiditgo"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    // console.log("connected")
  }

  togglecard() {
    this.cardTarget.classList.remove("d-none")

  }


}
