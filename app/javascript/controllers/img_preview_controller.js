// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['photo', 'preview']

  connect() {
  }

  loadPreview() {
    if (this.photoTarget.files && this.photoTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (file) => {
        this.previewTarget.innerHTML = '<img src="' + file.target.result +'">'
      }
      reader.readAsDataURL(this.photoTarget.files[0])
    }

  }
}

