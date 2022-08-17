import styles from "./course_card_component.scss";

class CourseCardComponent extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    const sheet = new CSSStyleSheet();
    sheet.replaceSync(styles);
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets, sheet];
  }
  connectedCallback() {
    const courseCardTemplate = $(this.getRootNode())
      .find("#course-card-template")
      .prop("content")
      .cloneNode(true);
    this.shadow.appendChild(courseCardTemplate);
    const name = this.getAttribute("name");
    const description = this.getAttribute("description");
    $(this.shadow).find(".card-title").text(name);
    $(this.shadow).find(".card-text").text(description);
    $(this.shadow).find("a").attr("href", this.getAttribute("link"));
  }
}

customElements.define("course-card", CourseCardComponent);
