import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["messages", "form", "input"]
  static values = { meetingId: Number }

  connect() {
    console.log("MeetingChatController connected", this.meetingIdValue);

    this.channel = createConsumer().subscriptions.create(
      { channel: "MeetingChatChannel", meeting_id: this.meetingIdValue },
      {
        received: (data) => {
          console.log("Received data:", data);
          this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
          this.inputTarget.value = "";
        }
      }
    );
  }

  disconnect() {
    this.channel.unsubscribe();
  }

  // submit(event) {
  //   event.preventDefault();
  //   console.log("submitting message!")
  //   this.formTarget.requestSubmit();
  // }
}
