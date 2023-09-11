import { Controller } from '@hotwired/stimulus'
import Choices from "choices"
console.log(Choices)

export default class extends Controller {
  static targets = ['select', 'arrow']
  static classes = ['regular', 'prompt', 'arrowPrompt']

  connect () {
    this.addClassToOptions()
    this.refreshSelectClass()
    if (this.selectTarget.multiple) {
      new NiceSelect(this.selectTarget, { searchable: true })
    }
  }

  // Add class to all the options to avoid inheriting the select's styles
  addClassToOptions () {
    this.selectTarget.querySelectorAll('option').forEach((option) => {
      if (option.value == '') {
        option.classList.add(this.promptClass)
      } else {
        option.classList.add(this.regularClass)
      }
    })
  }

  // Make the select look like a placeholder when the prompt is selected
  refreshSelectClass () {
    if (this.selectTarget.options[this.selectTarget.selectedIndex].value == '') {
      this.selectTarget.classList.add(this.promptClass)
      this.arrowTarget.classList.add(this.arrowPromptClass)
    } else {
      this.selectTarget.classList.remove(this.promptClass)
      this.arrowTarget.classList.remove(this.arrowPromptClass)
    }
  }
}
