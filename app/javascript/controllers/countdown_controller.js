import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    this.startCountdown();
  }

    updateTimer() {
      const currentTime = Math.floor(Date.now() / 1000);
      const remainingTime = this.endTimeValue - currentTime;
      const minutes = Math.floor(remainingTime / 60);
      const seconds = remainingTime % 60;

      this.timerTarget.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`;
    }
    startCountdown() {
      const timerTarget = this.targets.find("timer");
      const duration = parseInt(this.data.get("duration"));
      const endTime = new Date().getTime() + (duration * 60000);

      const updateTimer =() => {
        const now = new Date().getTime();
        const distance = endTimer - now;
          if (distance < 0) {
            clearInterval(countdown);
            timerTarget.textContent = "EXPIRED";
          } else {
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

            timerTarget.textContent = `${hours}h ${minutes}m ${seconds}s`;
          }
        };

      updateTimer();
      const countdown = setInterval(updateTimer, 1000);
    }
  }
