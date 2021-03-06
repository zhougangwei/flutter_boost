//
//  UIViewControllerDemo.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/17.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "UIViewControllerDemo.h"
#import <Flutter/Flutter.h>
#import "DemoRouter.h"
#import <flutter_boost2/FlutterBoostPlugin2.h>


@interface UIViewControllerDemo ()

@end

@implementation UIViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)pushFlutterPage:(id)sender {
    [DemoRouter.sharedRouter open:@"first"
                        urlParams:@{}
                             exts:@{@"animated":@(YES)}
                       completion:^(BOOL f){

    }];
}

- (IBAction)present:(id)sender {
    [DemoRouter.sharedRouter open:@"second"
                        urlParams:@{@"present":@(YES)}
                             exts:@{@"animated":@(YES)}
                       completion:^(BOOL f){}];
//    [self dismissViewControllerAnimated:YES completion:completion];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
