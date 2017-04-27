function PinterestPlugin() {
	// Does nothing
}
PinterestPlugin.prototype.pin = function(sourceURL, imageURL, description, successCallback, errorCallback) {
	cordova.exec(successCallback, errorCallback, "PinterestPlugin", "pin", [sourceURL, imageURL, description]);
};
module.exports = new PinterestPlugin();
