class LessonsList extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
  }
  connectedCallback() {
    const template = $(this.getRootNode())
      .find("#lessons-list-template")
      .prop("content");
    this.shadow.appendChild(template);
    $(this.shadow).find("#lessons-list-table").DataTable();
  }
}

customElements.define("lessons-list", LessonsList);
