//
//  PinterestPlugin.h

#import <Cordova/CDV.h>

@interface PinterestPlugin : CDVPlugin

- (void)initPinterest:(CDVInvokedUrlCommand*)command;;
- (void)pin:(CDVInvokedUrlCommand*)command;


@end
