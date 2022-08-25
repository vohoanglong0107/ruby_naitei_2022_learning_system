class ExamsList extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
  }
  connectedCallback() {
    const template = $(this.getRootNode())
      .find("#exams-list-template")
      .prop("content");
    this.shadow.appendChild(template);
    $(this.shadow)
      .find("#exams-list-table")
      .DataTable({ order: [[3, "desc"]] });
  }
}

customElements.define("exams-list", ExamsList);
