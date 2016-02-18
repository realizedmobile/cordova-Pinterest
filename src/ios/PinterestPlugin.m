//
//  Pinterest.m

#import "PinterestPlugin.h"

@implementation PinterestPlugin

@synthesize pinterest;
@synthesize clientId;

- (void) initPinterest:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    self.clientId = [[NSString alloc] initWithString:[command.arguments objectAtIndex:0]];
    [clientId performSelector:NSSelectorFromString(@"retain")];
    self.pinterest = [[Pinterest alloc] initWithClientId:self.clientId urlSchemeSuffix:@"prod"];
    if (self.pinterest != nil) {
        NSLog(@"Pinterest Plugin initalized with clientID: %@", self.clientId);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    } else{
        NSLog(@"Pinterest Plugin failed to initalize.");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) pin:(CDVInvokedUrlCommand*)command {
    NSURL *sourceURL = [NSURL URLWithString:[command.arguments objectAtIndex:0]];
    NSURL *imageURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
	NSString* description =[NSString stringWithString:[command.arguments objectAtIndex:2]];
    CDVPluginResult* pluginResult = nil;

    if ([pinterest canPinWithSDK]) {
        [pinterest createPinWithImageURL:imageURL
                               sourceURL:sourceURL
                             description:description];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Pinterest not available"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}
- (void)canPinWithSDK:(CDVInvokedUrlCommand*)command {
	CDVPluginResult* pluginResult = nil;
    
	if ([pinterest canPinWithSDK]) {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Can't pin with SDK"];
	}
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
