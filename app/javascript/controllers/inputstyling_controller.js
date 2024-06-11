import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inputstyling"
export default class extends Controller {
  static targets = ['input']

  connect() {
    this.inputTargets.forEach(inputTarget => {
      if (inputTarget.value === '') {
        inputTarget.style.color = "rgba(256,256,256,0.5)"
      } else {
        inputTarget.style.color = "white"
      }
    })

  }

  updateColor(e) {
    // console.log(e.currentTarget)
    if (e.currentTarget.value === '') {
      e.currentTarget.style.color = "rgba(256,256,256,0.5)"
    } else {
      e.currentTarget.style.color = "white"
    }
  }

}
