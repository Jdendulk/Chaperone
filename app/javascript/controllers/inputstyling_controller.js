import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inputstyling"
export default class extends Controller {


  connect() {
    console.log("connected!!!")
    const input = document.querySelector('#meeting_duration :first-child')
    const select = document.querySelector('#meeting_duration')
    input.disabled = true
    // input.style.color = "red";
    // select.value.color = "red";
  }
}
