import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source", "icon"]
  
  copy() {
    navigator.clipboard.writeText(this.sourceTarget.textContent)
    this.iconTarget.classList.toggle("animate-ping")

    setTimeout(() => {
      this.iconTarget.classList.toggle("animate-ping")
    }, 750)
  }
}
