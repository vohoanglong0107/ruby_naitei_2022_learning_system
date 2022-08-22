const { environment } = require("@rails/webpacker");
const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"],
  })
);

environment.loaders.append(
  "sass",
  {
    test: /\.scss$/,
    use: ["css-loader", "sass-loader"],
  },
  "sass"
);

module.exports = environment;
