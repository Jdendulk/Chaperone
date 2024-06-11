import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  countdown = null;

  static values = {
    duration: Number
  }

  connect() {
    this.hour = Math.floor(this.durationValue / 60)
    this.minutes = (this.durationValue - this.hour * 60)
    if (this.minutes == 0) {
      this.hour -= 1
      this.minutes = 59
    } else {
      this.minutes -= 1
    }

    this.seconds = 59
    // console.log(this.hour);
    // console.log(this.minutes);
    this.startCountdown();
  }
  disconnect() {
    clearInterval(this.countdown)
    // fetch requets which will do a patch update to meeting which will update current duration (this.hour, this.minute)

    }
    // add 15 function - dont disable the button normal behaviours, fetch what the current duration is and set this.hour, this.minute (from connect) and add 15,













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
        this.element.innerText = `THIS MEETING HAS EXPIRED 0${this.hour}:0${this.minutes}:${this.seconds}`;
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
          this.hours = 0
          this.seconds = 0
        }
      }
      this.element.innerText = `${this.hour < 10 ? "0" : ""}${this.hour}:${this.minutes < 10 ? "0" : ""}${this.minutes}:${this.seconds < 10 ? "0" : ""}${this.seconds}`
      }, 1000);
    }
}
      // if (this.hour < 10) {
      //   this.element.innerText = `0${this.hour}`

      //   if (this.minute < 10) {
      //     this.element.innerText = `0${this.minutes}`
      //   }

      //   if (this.seconds < 10) {
      //     this.element.innerText = `0${this.seconds}`
//   }
// }

      // if (this.hour == 0 && this.minutes == 0 && this.seconds == 0 ) {
      //   this.element.innerText = "EXPIRED"; }

  // clearInterval()




  // } else if (this.hour == 0 && this.minutes == 0 && this.seconds > 0 ) {
  //   this.seconds -= 1;
  // } else if (this.hour == 0 && this.minutes > 0 ) {
  //   this.seconds -= 1
  // }







  // const timerTarget = this.targets.find("timer");
  // const duration = parseInt(this.data.get("duration"));
  // const endTime = new Date().getTime() + (duration * 60000);

  // const updateTimer =() => {
  //   const now = new Date().getTime();
  //   const distance = endTime - now;
  //     if (distance < 0) {
  //       clearInterval(countdown);
  //       this.timerTarget.textContent = "EXPIRED";
  //     } else {
  //       const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  //       const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  //       const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  //       this.timerTarget.textContent = `${hours}h ${minutes}m ${seconds}s`;
  //     }
  //   };

  // updateTimer();
  // const countdown = setInterval(updateTimer, 1000);
