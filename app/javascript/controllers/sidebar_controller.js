// sidebar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "sidebar" ]

  connect() {
    this.headerHeight = document.querySelector('#header').offsetHeight;
    window.addEventListener('scroll', this.scroll.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.scroll.bind(this));
  }

  scroll() {
    if (window.pageYOffset > this.headerHeight) {
      this.sidebarTarget.classList.remove('top-50');
      this.sidebarTarget.classList.add('top-0');
    } else {
      this.sidebarTarget.classList.remove('top-0');
      this.sidebarTarget.classList.add('top-50');
    }
  }
}