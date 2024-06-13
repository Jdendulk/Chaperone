import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="call"
export default class extends Controller {
  // connect() {

  //   console.log("connected!")
  // }

  callme() {
    console.log("You're being called")
  }


}
