import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["schoolSelect", "schoolClassSelect"]

  connect() {
    this.schoolSelectTarget.addEventListener("change", this.updateSchoolClasses.bind(this))
  }

  async updateSchoolClasses() {
    const schoolId = this.schoolSelectTarget.value
    if (!schoolId) return

    const response = await fetch(`/schools/${schoolId}/school_classes`)
    const data = await response.json()

    this.schoolClassSelectTarget.innerHTML = data.map(schoolClass => 
      `<option value="${schoolClass.id}">${schoolClass.name}</option>`
    ).join('')
  }
}