import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    console.log("adding for git merge conflict");
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/jdendulk/clxa9kfiz00o301qq14v78iag",
    })
    this.#addCurrentLocationToMap()
    if (this.markersValue.length > 0) {
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    }

    window.setTimeout(() => {
      document.querySelector(".mapboxgl-ctrl-geolocate").click();

    }, 200);

  }
  // #addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {
  //     const customMarker = document.createElement("div")
  //     customMarker.innerHTML = marker.marker_html

  //     new mapboxgl.Marker(customMarker)
  //       .setLngLat([marker.lng, marker.lat])
  //       .addTo(this.map)
  //   })
  // }

  #addMarkersToMap() {
    // this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = this.markersValue[this.markersValue.length - 1].marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([this.markersValue[this.markersValue.length - 1].lng, this.markersValue[this.markersValue.length - 1].lat])
        .addTo(this.map)
    // })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
  #addCurrentLocationToMap() {
    const geoLocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true
    })
    this.map.addControl(geoLocate)
    }
}
