//
//  PinterestPlugin.h

#import <Cordova/CDV.h>
#import <Pinterest/Pinterest.h>

@interface PinterestPlugin : CDVPlugin
{
    Pinterest*    pinterest;
    NSString*     clientId;
}

@property (nonatomic, retain) Pinterest* pinterest;
@property (nonatomic, retain) NSString*     clientId;

- (void)initPinterest:(CDVInvokedUrlCommand*)command;;
- (void)pin:(CDVInvokedUrlCommand*)command;

@end