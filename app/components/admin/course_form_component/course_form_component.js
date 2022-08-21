class CourseForm extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
    this.handleAddLesson = this.handleAddLesson.bind(this);
  }
  connectedCallback() {
    this.courseFormTemplate = $(this.getRootNode())
      .find("#course-form-template")
      .prop("content");
    this.shadow.appendChild(this.courseFormTemplate);
    if (this.getAttribute("variant") === "edit") {
      this.newLessonTemplate = $(this.shadow)
        .find("#new-lesson-template")
        .prop("content")
        .cloneNode(true);

      $(this.shadow).find("#add-lesson").on("click", this.handleAddLesson);
    }
  }
  disconnectedCallback() {
    if (this.getAttribute("variant") === "edit") {
      $(this.shadow).find("#add-lesson").off("click", this.handleAddLesson);
    }
  }
  handleAddLesson(e) {
    e.preventDefault();
    const lessonsGroup = $(this.shadow).find("#lessons-group");
    const newLessonId = lessonsGroup.find(".input-group").length;
    const newLesson = this.newLessonTemplate.cloneNode(true);
    $(newLesson)
      .find("input")
      .each((_, inputField) => {
        for (const attrName of ["id", "name"]) {
          $(inputField).attr(
            attrName,
            $(inputField)
              .attr(attrName)
              .replace("new-lesson-template", newLessonId)
          );
        }
      });
    $(newLesson)
      .find("label")
      .each((_, label) => {
        $(label).html(
          $(label)
            .html()
            .replace("new-lesson-template", newLessonId + 1)
        );
      });
    lessonsGroup.append(newLesson);
  }
}

customElements.define("course-form", CourseForm);
