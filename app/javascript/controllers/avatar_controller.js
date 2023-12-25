import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "output", "input" ]

  preview() {
    console.log(this.inputTarget.files)
    console.log(this.outputTarget)
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      var reader = new FileReader();

      reader.onload = (event) => {
        this.outputTarget.src = event.target.result;
        this.outputTarget.style.display = 'block';
      }

      reader.readAsDataURL(this.inputTarget.files[0]);
      
    }
  }
}