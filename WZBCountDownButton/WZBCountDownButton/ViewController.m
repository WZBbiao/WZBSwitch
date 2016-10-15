//
//  ViewController.m
//  WZBCountDownButton
//
//  Created by 王振标 on 2016/10/15.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "ViewController.h"
#import "WZBCountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imageNames = [NSMutableArray array];
    for (NSInteger i = 10; i > 0; i--) {
        [imageNames addObject:[NSString stringWithFormat:@"number%zd", i]];
    }
    // Do any additional setup after loading the view, typically from a nib.
    [WZBCountDownButton playWithImages:imageNames begin:^(WZBCountDownButton *button) {
        NSLog(@"倒计时开始");
    } success:^(WZBCountDownButton *button) {
        NSLog(@"倒计时结束");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
