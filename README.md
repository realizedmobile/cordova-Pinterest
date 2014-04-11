# Cordova Pinterest Plugin
> Pinterest plugin for iOS, Android and Kindle, provides Pinterest SDK support in a Cordova app. Currently it only supports the 'pinning' feature. If you want to contribute to this project, you're welcome to send us a pull request.

## Preparation:
Before using this plugin, you need to set up a Pinterest Client ID. Go to [Pinterest Dev Site](https://developers.pinterest.com/manage/), login and generate a client ID.

## Installation:
cordova plugins add https://github.com/realizedmobile/cordova-Pinterest.git

## Usage
The plugin creates the object `PinterestPlugin`

After onDeviceReady, you have to initialize Pinterest with your client ID before using it;
init takes 3 arguments;
	
	1)  clientID - a Pinterest Client ID
	1)	successHandler - a function that will be called on success
	2)	errorHandler - a function that will be called on error.

Example:
	Pinterest.init("ClientID", successHandler, errorHandler);

To check if a version of the Pinterest app is installed, use canPinWidthSDK(). Currently, this feature only supports iOS, while on Android the Pinterest SDK will redirect users to the Google Play store if Pinterest is not available on their device.

canPinWithSDK takes 2 arguments;

	1)	successHandler - a function that will be called on success
	2)	errorHandler - a function that will be called on error.
	
Example:
	
	Pinterest.canPinWithSDK(successHandler, errorHandler);

To pin, use pin()
pin takes 5 arguments;

	1)	sourceURL - the url the Pin will link to.
	2)	imageURL - the url of the image to Pin.
	3)	description - a suggested Pin description.
	4)	resultHandler - a function that will be called on success
	5)	errorHandler - a function that will be called on error.

Example:

	PinterestPlugin.pin("http://placekitten.com", "http://placekitten.com/500/400", "Test", successHandler, errorHandler);
	

## More Info
The plugin includes the necessary libraries for the Pinterest SDK on iOS and Android. These will be installed when using Plugman to add the plugin.
	
## License ##
The MIT License

Copyright (c) 2014 Realized Mobile

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


=================
