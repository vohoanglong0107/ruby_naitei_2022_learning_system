import styles from "./lesson_node_component.scss";

class LessonNodeComponent extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    const sheet = new CSSStyleSheet();
    sheet.replaceSync(styles);
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets, sheet];
  }
  connectedCallback() {
    const lessonNodeTemplate = $(this.getRootNode())
      .find("#lesson-node-template")
      .prop("content")
      .cloneNode(true);
    this.shadow.appendChild(lessonNodeTemplate);
    if (this.getAttribute("completed") === "true") {
      this.shadow.querySelector("#incomplete-icon").remove();
    } else {
      this.shadow.querySelector("#complete-icon").remove();
    }
    $(this.shadow).find("a").attr("href", this.getAttribute("link"));
    const tooltipTriggerList = $(this.shadow).find(
      '[data-bs-toggle="tooltip"]'
    );
    tooltipTriggerList.each((_, element) => {
      $(element).attr("data-bs-title", this.getAttribute("tooltip"));
      new bootstrap.Tooltip(element);
    });
  }
}

customElements.define("lesson-node", LessonNodeComponent);
