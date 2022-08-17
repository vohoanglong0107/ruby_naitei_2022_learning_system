class WordsList extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
  }
  connectedCallback() {
    const template = $(this.getRootNode())
      .find("#words-list-template")
      .prop("content");
    this.shadow.appendChild(template);
    $(this.shadow).find("#words-list-table").DataTable();
  }
}

customElements.define("words-list", WordsList);
