import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inputstyling"
export default class extends Controller {
  static targets = ['dropdown']

  connect() {
    if (this.dropdownTarget.value === '') {
      this.dropdownTarget.style.color = "rgba(256,256,256,0.5)"
    } else {
      this.dropdownTarget.style.color = "white"
    }
  }

  updateColor() {
    if (this.dropdownTarget.value === '') {
      this.dropdownTarget.style.color = "rgba(256,256,256,0.5)"
    } else {
      this.dropdownTarget.style.color = "white"
    }
  }
}
