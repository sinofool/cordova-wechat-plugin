//
//  WeChatPlugin.h
//  1001YE
//
//  Created by Bochun Bai on 5/27/15.
//
//

#import <Cordova/CDVPlugin.h>

@interface WeChatPlugin : CDVPlugin

- (void) initAppScheme:(NSString*) scheme;
- (void) callWeChatPay:(NSString*) orderStr;

@end
