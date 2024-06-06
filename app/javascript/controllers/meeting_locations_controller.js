import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meeting-locations"
export default class extends Controller {
  connect() {
    const options = {
      enableHighAccuracy: false,
      timeout: 5000,
      maximumAge: 0,
    };

    navigator.geolocation.watchPosition(this.success, this.error, options)
  }

  success(pos) {
    const crd = pos.coords;

    console.log({ crd })
  }

  error(err) {
    console.error(`ERROR(${err.code}): ${err.message}`);
  }
}
