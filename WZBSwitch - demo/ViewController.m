//
//  ViewController.m
//  WZBSwitch - demo
//
//  Created by WZB on 2016/10/14.
//  Copyright © 2016年 normal. All rights reserved.
//

#import "ViewController.h"
#import "WZBSwitch.h"

#define WZBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface ViewController () <WZBSwitchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 初始化方法
     *  switchValueChange: 开关状态改变回调block
     */
    WZBSwitch *switchView = [[WZBSwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 25) switchValueChanged:^(WZBSwitch *swith, BOOL on) {
        // do someing
        NSLog(@"on----%d", on);
    }];
    [self.view addSubview:switchView];
    // delegate
    switchView.delegate = self;
    
    // 设置所有颜色
//    [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor, UIColor *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
//        // 可以通过这种方法设置需要设置的颜色
//        *onTintColor = [UIColor redColor];
//        *onBackgroundColor = [UIColor blueColor];
//        *offTintColor = [UIColor greenColor];
//        *offBackgroundColor = [UIColor grayColor];
//        *tintColor = [UIColor blackColor];
//        return nil;
//    }];
    [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor, UIColor *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
        // 也可以通过这种方法设置需要设置的颜色
        return @{OnTintColor : WZBColor(234, 67, 53), OnBackgroundColor : WZBColor(244, 161, 154), OffTintColor : WZBColor(255, 255, 255), OffBackgroundColor : WZBColor(214, 214, 214), TintColor : [UIColor colorWithRed:0.8252 green:0.8252 blue:0.8252 alpha:1.0]};
    }];
}

#pragma mark - WZBSwitchDelegate
- (void)switchValueChange:(WZBSwitch *)swith on:(BOOL)on {
    // do someing
}

@end
