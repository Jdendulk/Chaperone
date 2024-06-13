import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="howdiditgo"
export default class extends Controller {
  static targets = ["cardgood", "cardok", "cardbad", "cardarea"];

  connect() {
    // console.log(this.cardokTarget); //
  }

  togglecardgood() {
    this.cardgoodTarget.classList.add("d-none");
    this.cardokTarget.classList.add("d-none");
    this.cardbadTarget.classList.add("d-none");
    this.cardgoodTarget.classList.remove("d-none");
  }

  togglecardok() {
    this.cardgoodTarget.classList.add("d-none");
    this.cardokTarget.classList.add("d-none");
    this.cardbadTarget.classList.add("d-none");
    this.cardokTarget.classList.remove("d-none");
  }

  togglecardbad() {
    this.cardgoodTarget.classList.add("d-none");
    this.cardokTarget.classList.add("d-none");
    this.cardbadTarget.classList.add("d-none");
    this.cardbadTarget.classList.remove("d-none");
  }



}
