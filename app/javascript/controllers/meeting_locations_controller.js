import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meeting-locations"
export default class extends Controller {
  static values = {
    meeting: Number
  }

  connect() {
    const options = {
      enableHighAccuracy: false,
      timeout: 5000,
      maximumAge: 0,
    };

    navigator.geolocation.watchPosition(this.success.bind(this.meetingValue), this.error, options)
  }

  success(pos) {
    const crd = pos.coords;
    console.log(crd);
    const csrf = document.querySelector('meta[name="csrf-token"]').content

    let formData = new FormData();
    formData.append('latitude', crd.latitude);
    formData.append('longitude', crd.longitude);

    fetch(`http://localhost:3000/meetings/${this}/locations`, {
      method: 'POST',
      headers: { "Accept": "application/json", "X-CSRF-Token": csrf },
      body: formData
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data)
      })
      .catch(error => {
        console.error('Error updating location:', error.message)
      })
  }

  error(err) {
    console.error(`ERROR(${err.code}): ${err.message}`);
  }
}
