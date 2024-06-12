import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['timer']

  countdown = null;

  static values = {
    duration: Number,
    meetingId: Number
  }

  connect() {
    console.log(this.durationValue)
    this.hour = Math.floor(this.durationValue / 60)
    console.log(this.hour);
    this.minutes = (this.durationValue - this.hour * 60)
    if (this.minutes == 0) {
      this.hour -= 1
      this.minutes = 59
    } else {
      this.minutes -= 1
    }

    this.seconds = 59
    console.log(this.hour);
    console.log(this.minutes);
    this.startCountdown();
  }

  get remainingDuration() {
    return (this.hour * 60) + this.minutes;
  }

  extendSession(event) {
    event.preventDefault()
    this.initialiseTimer(this.remainingDuration + 15);
  }

  disconnect() {
    this.updateDuration()
    clearInterval(this.countdown)
  }
  csrfToken() {
    return document.querySelector("meta[name='csrf-token']").content
  }

  initialiseTimer(duration) {
    clearInterval(this.countdown)

    this.hour = Math.floor(duration / 60);
    this.minutes = duration % 60;
    this.seconds = 59;

    this.updateDuration();

    this.startCountdown()
  }

  updateDuration(){
    let remainingDuration = (this.hour * 60) + this.minutes;
    this.seconds < 30 ? remainingDuration - 1 : remainingDuration;
    const csrf = this.csrfToken()
    fetch(`/meetings/${this.meetingIdValue}/extend`, {
      method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': csrf
        },
        body: JSON.stringify( { id: this.meetingIdValue, meeting: { duration: remainingDuration } } )
      })
    }

  // updateTimer() {
  //   const currentTime = Math.floor(Date.now() / 1000);
  //   const remainingTime = this.endTimeValue - currentTime;
  //   const minutes = Math.floor(remainingTime / 60);
  //   const seconds = remainingTime % 60;

  //   this.timerTarget.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`;
  // }
  startCountdown() {
    this.countdown = setInterval(() => {

      // console.log("hour", this.hour)
      // console.log("minutes", this.minutes)
      // console.log("seconds", this.seconds)

      if (this.hour <= 0 && this.minutes <= 0 && this.seconds <= 0) {
        this.timerTarget.innerText = `THIS MEETING HAS EXPIRED 0${this.hour}:0${this.minutes}:${this.seconds}`;
        return clearInterval(this.countdown)
      }

      if (this.minutes === 0) {
        this.hour -= 1
        this.seconds = 59
      }
      if ((this.hour >= 0 && this.minutes >= 0) && (this.seconds >= 0)) {
        this.seconds -= 1
      }


      if (this.seconds === 0) {
        this.seconds = 59
        this.minutes -= 1
        if (this.minutes == 0 && this.hour >= 1) {
          this.hour -= 1
          this.minutes = 59
        } else if (this.minutes <= 0 && this.hour < 1) {
          this.minutes = 0
          this.hour = 0
          this.seconds = 0
        }
      }
      this.timerTarget.innerText = `${this.hour < 10 ? "0" : ""}${this.hour}:${this.minutes < 10 ? "0" : ""}${this.minutes}:${this.seconds < 10 ? "0" : ""}${this.seconds}`
      }, 1000);
    }
}
