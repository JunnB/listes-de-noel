import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dark", "light", "label"]

  connect() {
    this.assignCurrentMode()
  }

  toggle() {
    // if set via local storage previously
    if (localStorage.getItem('color-theme')) {
      if (localStorage.getItem('color-theme') === 'light') {
        this.setDarkMode()
      } else {
        this.setLightMode()
      }

      // if NOT set via local storage previously
    } else {
      if (document.documentElement.classList.contains('dark')) {
        this.setLightMode()
      } else {
        this.setDarkMode()
      }
    }
  }

  resetSystemMode() {
    localStorage.removeItem('color-theme')
    this.assignCurrentMode()
  }

  assignCurrentMode() {
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      this.labelTarget.textContent = 'Thème lumineux';
      document.documentElement.classList.add('dark')
    } else {
      this.labelTarget.textContent = 'Thème sombre';
      document.documentElement.classList.remove('dark')
    }
  }

  setLightMode() {
    this.labelTarget.textContent = 'Thème sombre';
    document.documentElement.classList.remove('dark')
    localStorage.setItem('color-theme', 'light')
  }

  setDarkMode() {
    this.labelTarget.textContent = 'Thème lumineux';
    document.documentElement.classList.add('dark')
    localStorage.setItem('color-theme', 'dark')
  }
}
