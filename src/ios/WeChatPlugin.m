//
//  WeChatPlugin.m
//  1001YE
//
//  Created by Bochun Bai on 5/27/15.
//
//

#import "WeChatPlugin.h"
#import "WXApi.h"

@implementation WeChatPlugin

- (void) initAppScheme:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;
    
    NSString* scheme = [command.arguments objectAtIndex:0];
    if (scheme != nil) {
        [WXApi registerApp:scheme];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void) callWeChatPay:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;
    
    NSString* orderStr = [command.arguments objectAtIndex:0];
    if (orderStr != nil) {
        PayReq *req = [[PayReq alloc] init];
        req.partnerId = [command.arguments objectAtIndex:1];
        req.prepayId = orderStr;
        req.package = @"Sign=WXPay";
        req.nonceStr = [command.arguments objectAtIndex:2];
        req.timeStamp = [[command.arguments objectAtIndex:3] integerValue];
        req.sign = [command.arguments objectAtIndex:4];
        [WXApi sendReq:req];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
