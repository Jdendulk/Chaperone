import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session"
export default class extends Controller {
  static targets = ["image"]
  connect() {

    this.startFading();
  }
    startFading() {
      this.imageTarget.classList.add("fade-in")
      setInterval(() => {
        this.imageTarget.classList.toggle("fade-in")
        this.imageTarget.classList.toggle("fade-out")
      }, 1200) // Change to the desired interval in milliseconds
    }
  }
