import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meeting-locations"
export default class extends Controller {
  static values = {
    meeting: Number,
    url: String
  }

  connect() {
    const options = {
      enableHighAccuracy: false,
      timeout: 60000,
      maximumAge: 0,
    };

    navigator.geolocation.watchPosition(this.success.bind([this.meetingValue, this.urlValue]), this.error, options)
  }

  success(pos) {
    console.log(pos)
    const crd = pos.coords;
    const csrf = document.querySelector('meta[name="csrf-token"]').content
    const [path, url] = this

    let formData = new FormData();
    formData.append('latitude', crd.latitude);
    formData.append('longitude', crd.longitude);

    fetch(`${url}/${path}/locations`, {
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
