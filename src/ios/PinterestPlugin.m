//
//  Pinterest.m

#import "PinterestPlugin.h"

@implementation PinterestPlugin

@synthesize pinterest;
@synthesize clientId;

- (void) initPinterest:(CDVInvokedUrlCommand*)command
{
    self.clientId = [[NSString alloc] initWithString:[command.arguments objectAtIndex:0]];
    if (self.pinterest == nil){
        self.pinterest = [[Pinterest alloc] initWithClientId:self.clientId urlSchemeSuffix:@"prod"];
	}
    NSLog(@"Pinterest Plugin initalized with clientID: %@", self.clientId);
}

-(void) pin:(CDVInvokedUrlCommand*)command {
    NSURL *sourceURL = [NSURL URLWithString:[command.arguments objectAtIndex:0]];
    NSURL *imageURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
	NSString* description =[NSString stringWithString:[command.arguments objectAtIndex:2]];
    
    if ([pinterest canPinWithSDK]) {
        [pinterest createPinWithImageURL:imageURL
                               sourceURL:sourceURL
                             description:description];
    } else {
        NSString *urlstring = [NSString stringWithFormat:
                               @"http://www.pinterest.com/pin/create/button/?url=%@&media=%@&description=%@",sourceURL, imageURL, description];
        urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"Can't pin using app, trying to open up a browser%@", urlstring);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: urlstring]];
    }
    
}

@end