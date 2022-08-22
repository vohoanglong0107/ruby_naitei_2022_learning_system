class AdminPageCoursesShowComponent extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
  }

  connectedCallback() {
    const courseFormTemplate = $(this.getRootNode())
      .find("#admin-page-courses-show-template")
      .prop("content");
    this.shadow.appendChild(courseFormTemplate);
  }
}

customElements.define("admin-page-courses-show", AdminPageCoursesShowComponent);
