//
//  Pinterest.m

#import "PinterestPlugin.h"

#import "PDKClient.h"
#import "PDKPin.h"

@implementation PinterestPlugin

- (void) initPinterest:(CDVInvokedUrlCommand*)command
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
         suggestedBoardName:@""
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
}

@end
