class LessonNode {
  constructor(node) {
    this.node = node;
  }
  toggleDirection(direction) {
    switch (direction) {
      case "left":
        this.horizontal.toggleClass("clip-half-left");
        break;
      case "right":
        this.horizontal.toggleClass("clip-half-right");
        break;
      case "top":
        this.vertical.toggleClass("clip-half-left");
        break;
      case "bottom":
        this.vertical.toggleClass("clip-half-right");
        break;
    }
  }
  toggleHorizontal() {
    this.horizontal.toggleClass("clip-all");
  }
  toggleVertical() {
    this.vertical.toggleClass("clip-all");
  }
  get horizontal() {
    return $(this.node.children()[0]);
  }

  get vertical() {
    return $(this.node.children()[1]);
  }
}

// ******   <- main rows
//      *   <- empty row
// ******   <- main rows
// *
// ******
//      *

class MapDrawer {
  constructor(lessonNodes, pathNode, container) {
    this.currentRow = 0;
    this.numNodeCurrentRow = 0;
    this.lessonNodes = lessonNodes;
    this.numLessonNodes = lessonNodes.length;
    this.pathNode = pathNode;
    this.container = container;
  }
  draw() {
    this.resizeContainer();
    while (this.hasRemainingLessonNodes()) {
      if (this.isMainRow()) {
        this.drawMainRow();
      } else {
        this.drawEmptyRow();
      }
      this.endTurn();
    }
  }
  resizeContainer() {
    this.container.empty();
    this.container.css(
      "grid-template-columns",
      `repeat(${this.numTotalNodesPerRow}, min-content)`
    );
  }
  isMainRow() {
    return this.currentRow % 2 === 0;
  }
  drawMainRow() {
    const lesson = new LessonNode($(this.lessonNodes.splice(0, 1)[0]));
    this.addLessonNode(lesson);
    if (!this.isLastInRow()) {
      if (this.hasRemainingLessonNodes()) {
        this.advanceNode();
        this.addPathNode(false);
      } else {
        this.drawFillerNodes();
      }
    }
  }
  drawEmptyRow() {
    if (this.isFirstInRow()) {
      this.addPathNode(true);
    } else {
      this.addEmptyNode();
    }
  }
  drawFillerNodes() {
    while (this.numNodeCurrentRow < this.numTotalNodesPerRow) {
      this.addEmptyNode();
      this.advanceNode();
    }
  }
  addLessonNode(lessonNode) {
    this.fit(lessonNode);
    this.addNode(lessonNode.node);
  }
  fit(lessonNode) {
    if (this.isVertialLayout()) {
      this.fitVerticalLayout(lessonNode);
      if (this.isFirstLessonNode()) {
        lessonNode.toggleDirection("top");
      } else if (this.isLastLessonNode()) {
        lessonNode.toggleDirection("bottom");
      }
    } else {
      if (this.isFirstLessonNode()) {
        this.fitFirst(lessonNode);
      } else if (this.isLastLessonNode()) {
        this.fitLast(lessonNode);
      } else if (this.isFirstInRow()) {
        this.fitFirstInRow(lessonNode);
      } else if (this.isLastInRow()) {
        this.fitLastInRow(lessonNode);
      } else {
        this.fitMiddleOfRow(lessonNode);
      }
    }
  }
  isVertialLayout() {
    return this.numNodesPerRow === 1;
  }
  fitVerticalLayout(lessonNode) {
    lessonNode.toggleHorizontal();
  }
  isFirstLessonNode() {
    return this.numLessonNodes === this.remainingLessonNodes + 1;
  }
  fitFirst(lessonNode) {
    lessonNode.toggleVertical();
    lessonNode.toggleDirection("left");
  }
  isLastLessonNode() {
    return !this.hasRemainingLessonNodes();
  }
  fitLast(lessonNode) {
    if (this.isFirstInRow()) {
      lessonNode.toggleHorizontal();
      lessonNode.toggleDirection("bottom");
    } else {
      lessonNode.toggleVertical();
      if (this.currentDirection === "right") {
        lessonNode.toggleDirection("right");
      } else {
        lessonNode.toggleDirection("left");
      }
    }
  }
  fitFirstInRow(lessonNode) {
    lessonNode.toggleDirection("bottom");
    if (this.currentDirection === "right") {
      lessonNode.toggleDirection("left");
    } else {
      lessonNode.toggleDirection("right");
    }
  }
  fitLastInRow(lessonNode) {
    lessonNode.toggleDirection("top");
    if (this.currentDirection === "right") {
      lessonNode.toggleDirection("right");
    } else {
      lessonNode.toggleDirection("left");
    }
  }
  fitMiddleOfRow(lessonNode) {
    lessonNode.toggleVertical();
  }

  addPathNode(vertical) {
    const pathNode = this.pathNode.clone();
    if (vertical) {
      pathNode.addClass("rotate-90");
    }
    this.addNode(pathNode);
  }
  addEmptyNode() {
    const empty_node = jQuery("<div>");
    this.addNode(empty_node);
  }
  addNode(node) {
    const order = this.calculateNodeOrder();
    node.css("order", order);
    this.container.append(node);
  }
  calculateNodeOrder() {
    const numNodesPreviousRows = this.numTotalNodesPerRow * this.currentRow;
    const rightWardOrder = this.numNodeCurrentRow + 1;
    const leftWardOrder = this.numTotalNodesPerRow - this.numNodeCurrentRow + 1;
    const nodeOrderThisRow =
      this.currentDirection === "left" ? leftWardOrder : rightWardOrder;
    return numNodesPreviousRows + nodeOrderThisRow;
  }
  endTurn() {
    if (this.isLastInRow()) {
      this.advanceRow();
    } else {
      this.advanceNode();
    }
  }
  advanceNode() {
    this.numNodeCurrentRow++;
  }
  advanceRow() {
    this.currentRow++;
    this.numNodeCurrentRow = 0;
  }
  hasRemainingLessonNodes() {
    return this.remainingLessonNodes > 0;
  }
  isFirstInRow() {
    return this.numNodeCurrentRow === 0;
  }
  isLastInRow() {
    return this.numNodeCurrentRow === this.numTotalNodesPerRow - 1;
  }
  get currentDirection() {
    return this.currentRow % 4 === 0 || this.currentRow % 4 === 3
      ? "right"
      : "left";
  }
  get remainingLessonNodes() {
    return this.lessonNodes.length;
  }
  get numNodesPerRow() {
    return this._numNodesPerRow;
  }
  set numNodesPerRow(numNodesPerRow) {
    this._numNodesPerRow = numNodesPerRow;
  }
  get numTotalNodesPerRow() {
    const numEmptyNodesPerRow = this.numNodesPerRow - 1;
    return this.numNodesPerRow + numEmptyNodesPerRow;
  }
}

$(window).on("turbolinks:load", function () {
  if (
    $("#lesson-nodes").length < 1 ||
    $("#map-path-nodes").length < 1 ||
    $("#course-map").length < 1
  ) {
    return;
  }
  const pathNode = $($("#map-path-nodes").prop("content").children);
  const container = $("#course-map");
  // media query event handler for 576px and 768px and 992px and 1200px and above
  const mq576 = window.matchMedia("(max-width: 576px)");
  const mq768 = window.matchMedia("(max-width: 768px) and (min-width: 576px)");
  const mq992 = window.matchMedia("(max-width: 992px) and (min-width: 768px)");
  const mq1200 = window.matchMedia(
    "(max-width: 1200px) and (min-width: 992px)"
  );
  const mqAbove1200 = window.matchMedia("(min-width: 1200px)");
  const mqs = [mq576, mq768, mq992, mq1200, mqAbove1200];
  const mqChange = (mq, callback) => {
    mq.addListener(callback);
    callback(mq);
  };
  mqs.forEach((mq, index) => {
    mqChange(mq, (mq) => {
      if (mq.matches) {
        const template = $("#lesson-nodes").prop("content").cloneNode(true);
        const nodes = $(template).children();
        const mapDrawer = new MapDrawer(nodes, pathNode, container);
        mapDrawer.numNodesPerRow = index + 1;
        mapDrawer.draw();
      }
    });
  });
});
