// app/javascript/controllers/share_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("ShareController connected");
    console.log(this.element)
    new bootstrap.Tooltip(this.element)
  }
}
