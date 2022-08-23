class LessonForm extends HTMLElement {
  constructor() {
    super();
    this.shadow = this.attachShadow({ mode: "open" });
    this.shadow.adoptedStyleSheets = [...document.adoptedStyleSheets];
    this.handleAddWord = this.handleAddWord.bind(this);
  }
  connectedCallback() {
    this.lessonFormTemplate = $(this.getRootNode())
      .find("#lesson-form-template")
      .prop("content");
    this.shadow.appendChild(this.lessonFormTemplate);
    console.log("nani?, ", $(this.shadow).find("#new-word-template"));
    this.newWordTemplate = $(this.shadow)
      .find("#new-word-template")
      .prop("content")
      .cloneNode(true);

    $(this.shadow).find("#add-word").on("click", this.handleAddWord);
  }
  disconnectedCallback() {
    $(this.shadow).find("#add-word").off("click", this.handleAddWord);
  }
  handleAddWord(e) {
    e.preventDefault();
    const wordsGroup = $(this.shadow).find("#words-group");
    const newWordId = wordsGroup.find(".input-group").length;
    const newWord = this.newWordTemplate.cloneNode(true);
    $(newWord)
      .find("input")
      .each((_, inputField) => {
        for (const attrName of ["id", "name"]) {
          $(inputField).attr(
            attrName,
            $(inputField).attr(attrName).replace("new-word-template", newWordId)
          );
        }
      });
    $(newWord)
      .find("label")
      .each((_, label) => {
        $(label).html(
          $(label)
            .html()
            .replace("new-word-template", newWordId + 1)
        );
      });
    wordsGroup.append(newWord);
  }
}

customElements.define("lesson-form", LessonForm);
