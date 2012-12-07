var jam = {
    "packages": [
        {
            "name": "jquery",
            "location": "javascripts/vendor/jquery",
            "main": "jquery.js"
        },
        {
            "name": "jqueryui.accordion",
            "location": "javascripts/vendor/jquery-ui/dist/minified",
            "main": "jquery.ui.accordion.min.js"
        },
        {
            "name": "jquery.scrollTo",
            "location": "javascripts/vendor/jquery.scrollTo",
            "main": "jquery.scrollTo.js"
        }
    ],
    "version": "0.2.11",
    "shim": {}
};

if (typeof require !== "undefined" && require.config) {
    require.config({packages: jam.packages, shim: jam.shim});
}
else {
    var require = {packages: jam.packages, shim: jam.shim};
}

if (typeof exports !== "undefined" && typeof module !== "undefined") {
    module.exports = jam;
}