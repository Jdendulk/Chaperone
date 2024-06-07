// import { Controller } from "@hotwired/stimulus"
// import { createConsumer } from "@rails/actioncable"

// export default class extends Controller {
//   static targets = ["messages", "form", "input"]
//   static values = { meetingId: Number }

//   connect() {
//     console.log("MeetingChatController connected", this.meetingIdValue);

//     this.channel = createConsumer().subscriptions.create(
//       { channel: "MeetingChatChannel", meeting_id: this.meetingIdValue },
//       {
//         received: (data) => {
//           console.log("Received data:", data);
//           this.messagesTarget.insertAdjacentHTML("beforeend", data.message);
//           this.inputTarget.value = "";
//         }
//       }
//     );
//   }

//   disconnect() {
//     this.channel.unsubscribe();
//   }

//   // submit(event) {
//   //   event.preventDefault();
//   //   console.log("submitting message!")
//   //   this.formTarget.requestSubmit();
//   // }
// }
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

  submit(event) {
    event.preventDefault();
    const content = this.inputTarget.value.trim();
    if (content === "") {
      this.displayErrorMessage("Type at least one character");
      return;
    }

    // Handle form submission via AJAX
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({
        message: {
          content: content,
          meeting_id: this.meetingIdValue
        }
      })
    }).then(response => {
      if (response.ok) {
        this.inputTarget.value = ""; // Clear the input field
      } else {
        response.text().then(text => this.displayErrorMessage(text));
      }
    }).catch(error => {
      console.error('Error:', error);
      this.displayErrorMessage('Something went wrong');
    });
  }

  displayErrorMessage(message) {
    const existingErrorMessage = document.getElementById("error_message");
    if (!existingErrorMessage) {
      const errorExplanation = document.createElement("div");
      errorExplanation.id = "error_explanation";
      errorExplanation.innerHTML = `<ul id="error_message"><li>${message}</li></ul>`;
      this.formTarget.insertAdjacentElement("beforebegin", errorExplanation);
      setTimeout(() => {
        errorExplanation.remove();
      }, 2000);
    }
  }
}
