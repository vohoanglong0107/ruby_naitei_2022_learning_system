function importAllCSS(r) {
  r.keys().forEach((e) => {
    const css = r(e);
    const sheet = new CSSStyleSheet();
    sheet.replaceSync(css.toString());
    document.adoptedStyleSheets = [...document.adoptedStyleSheets, sheet];
  });
}

function importAllJS(r) {
  r.keys().forEach(r);
}

importAllCSS(require.context("../components", true, /[_\/]component\.scss$/));
importAllJS(require.context("../components", true, /[_\/]component\.js$/));
