import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "term" ]

  addQueryString() {
    if (this.term === "") {
      const cleanURL = location.protocol + "//" + location.host + location.pathname;
      history.replaceState({}, document.title, cleanURL);
    } else {
      history.replaceState(null, null, `?search_term=${this.term}`);
    }
  }

  get term() {
    return this.termTarget.value;
  }
}