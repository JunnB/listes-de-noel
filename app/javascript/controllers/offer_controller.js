import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["offer"]

  openModal(event) {
    if(this.offerTarget){
      document.querySelector('#offer_comment').textContent = this.offerTarget.textContent;
      document.querySelector('#offer_price').textContent = this.offerTarget.getAttribute('data-price');
      document.querySelector('#offer_status').value = this.offerTarget.getAttribute('data-status');
      document.querySelector('#offer_is_buyer').textContent = this.offerTarget.getAttribute('data-is-buyer');
    }

    var giftId = event.currentTarget.getAttribute('data-gift-id');
    var giftName = event.currentTarget.getAttribute('data-gift-name');
    var recipientName = event.currentTarget.getAttribute('data-gift-recipient-name');

    document.querySelector('#offer-form-modal input[name="offer[gift_id]"]').value = giftId;
    document.querySelector('#offer-gift-name').textContent = giftName;
    document.querySelector('#offer-gift-recipient-name').textContent = recipientName;

    // set the modal menu element
    const $targetEl = document.getElementById('offer-form-modal');
    new Modal($targetEl).show();
  }

  closeModal() {
    // set the modal menu element
    const $targetEl = document.getElementById('offer-form-modal');
    new Modal($targetEl).hide();
  }
}