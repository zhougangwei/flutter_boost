//
//  DemoRouter.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/22.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "DemoRouter.h"
#import <flutter_boost2/FlutterBoost2.h>

@implementation DemoRouter

+ (DemoRouter *)sharedRouter
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//AB Boost 2 switch
- (BOOL)useBoost2
{
    return YES;
}

#pragma mark - Boost 2
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    if([params[@"present"] boolValue]){
        FLB2FlutterViewContainer *vc = FLB2FlutterViewContainer.new;
        [vc setName:name params:params];
        [self.navigationController presentViewController:vc animated:animated completion:^{
            if(completion) completion(YES);
        }];
    }else{
        FLB2FlutterViewContainer *vc = FLB2FlutterViewContainer.new;
        [vc setName:name params:params];
        [self.navigationController pushViewController:vc animated:animated];
        if(completion) completion(YES);
    }
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLB2FlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLB2FlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}

#pragma mark - Boost 1
- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion
{
    if([self useBoost2]){
        NSMutableDictionary *exts = NSMutableDictionary.new;
        exts[@"url"] = name;
        exts[@"params"] = params;
        exts[@"animated"] = @(animated);
        [self open:name urlParams:params exts:exts completion:completion];
        return;
    }
    
    if([params[@"present"] boolValue]){
        FLB2FlutterViewContainer *vc = FLB2FlutterViewContainer.new;
        [vc setName:name params:params];
        [self.navigationController presentViewController:vc animated:animated completion:^{
            if(completion) completion(YES);
        }];
    }else{
        FLB2FlutterViewContainer *vc = FLB2FlutterViewContainer.new;
        [vc setName:name params:params];
        [self.navigationController pushViewController:vc animated:animated];
        if(completion) completion(YES);
    }
}

- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    if([self useBoost2]){
        NSMutableDictionary *exts = NSMutableDictionary.new;
        exts[@"params"] = params;
        exts[@"animated"] = @(animated);
        [self close:uid result:@{} exts:exts completion:completion];
        return;
    }
    
    FLB2FlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLB2FlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
@end
