//
//  PinterestPlugin.m

#import "PinterestPlugin.h"

#import <PinterestSDK/PDKClient.h>
#import <PinterestSDK/PDKPin.h>

@implementation PinterestPlugin

- (void) pluginInitialize
{
    NSString* appId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"PinterestAppId"];
    [PDKClient configureSharedInstanceWithAppId:appId];
}

- (void) pin:(CDVInvokedUrlCommand*)command {
    NSURL *sourceURL = [NSURL URLWithString:[command.arguments objectAtIndex:0]];
    NSURL *imageURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
    NSString* description =[NSString stringWithString:[command.arguments objectAtIndex:2]];

    __weak PinterestPlugin *weakSelf = self;

    [PDKPin pinWithImageURL:imageURL
                       link:sourceURL
         suggestedBoardName:@"test"
                       note:description
                withSuccess:^ {
                  CDVPluginResult* pluginResult = nil;
                  pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                  [weakSelf.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                 }
                 andFailure:^(NSError *error) {
                   CDVPluginResult* pluginResult = nil;
                   pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
                   [weakSelf.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                 }];

    // As of 2017-04-27, the callbacks of pinWithImageURL are not being called,
    // so we have to consider that the pin was done,
    // or at least that the user was given the possibility of doing it.
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 * This should handle the callback from Pinterest, whenever they decide to actually call it.
 */
- (void)handleOpenURL:(NSNotification *)notification {
    NSURL* url = [notification object];
    if ([url isKindOfClass:[NSURL class]]) {
        [[PDKClient sharedInstance] handleCallbackURL:url];
    }
}

@end
