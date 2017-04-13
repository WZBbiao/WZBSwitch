//
//  WZBSwitch.m
//  自定义开关
//
//  Created by WZB on 16/7/27.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import "WZBSwitch.h"

#define WZBScreenW [UIScreen mainScreen].bounds.size.width
#define WZBScreenH [UIScreen mainScreen].bounds.size.height
#define WZBWhiteColor [UIColor whiteColor]
#define WZBGreenColor [UIColor greenColor]
#define WZBLightGrayColor [UIColor lightGrayColor]

@interface WZBSwitch ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation WZBSwitch

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame switchValueChanged:nil];
}

- (instancetype)initWithFrame:(CGRect)frame switchValueChanged:(SwitchValueChangeBlock)switchValueChange {
    self = [super initWithFrame:frame];
    if (self) {
        if (frame.size.width == 0 || frame.size.height == 0) {
            frame = CGRectMake(0, 0, 100, 50);
        }
        [self setupWithFrame:frame];
        if (switchValueChange) self.switchValueChange = switchValueChange;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupWithFrame:self.frame];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame {
    _on = NO;
    self.userInteractionEnabled = YES;
    [self setupConfigWithFrame:frame];
}

- (void)setupConfigWithFrame:(CGRect)frame {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = frame.size.width;
    CGFloat h = frame.size.height;
    self.bottomView = [[UIView alloc] initWithFrame:(CGRect) {x, y, w, h / 2}];
    CGPoint center = self.bottomView.center;
    center.y = frame.size.height / 2;
    self.bottomView.center = center;
    [self addSubview:_bottomView];
    self.bottomView.layer.cornerRadius = self.bottomView.frame.size.height / 2;

    self.topView = [[UIView alloc] initWithFrame:(CGRect) {x, y / 3, h, h}];
    CGPoint topViewCenter = self.topView.center;
    topViewCenter.y = frame.size.height / 2;
    self.topView.center = topViewCenter;
    [self addSubview:_topView];
    self.topView.layer.cornerRadius = self.topView.frame.size.height / 2;
    self.onTintColor = self.offTintColor = self.offBackgroundColor = WZBWhiteColor;
    self.onBackgroundColor = WZBGreenColor;
    self.tintColor = WZBLightGrayColor;
    [self setSwitchColorWithStatus:_on];
}

- (void)setOn:(BOOL)newOn animated:(BOOL)animated {
    
    __block CGRect frame = self.topView.frame;
    CGFloat newX = newOn ? self.frame.size.width - self.topView.frame.size.width : 0;
    [UIView animateWithDuration:animated ? 0.2 : 0.0 animations:^{
        frame.origin.x = newX;
        self.topView.frame = frame;
        [self setSwitchColorWithStatus:newOn];
    } completion:^(BOOL finished) {
        if (finished) {
            // delegate
            if ([self.delegate respondsToSelector:@selector(switchValueChange:on:)]) {
                [self.delegate switchValueChange:self on:newOn];
            }
            // block
            if (self.switchValueChange) {
                self.switchValueChange(self, newOn);
            }
        }
    }];
    _on = newOn;
}

- (void)setUpAllColors:(NSDictionary *(^)(UIColor **onTintColor,UIColor **onBackgroundColor, UIColor **offTintColor, UIColor **offBackgroundColor, UIColor **tintColor))allColorBlock {
    [self setUpAllColors:allColorBlock switchValueChanged:self.switchValueChange];
}

- (void)setUpAllColors:(NSDictionary *(^)(UIColor **onTintColor,UIColor **onBackgroundColor, UIColor **offTintColor, UIColor **offBackgroundColor, UIColor **tintColor))allColorBlock switchValueChanged:(SwitchValueChangeBlock)switchValueChange {
    if (switchValueChange) self.switchValueChange = switchValueChange;
    UIColor *onTintColor, *onBackgroundColor, *offTintColor, *offBackgroundColor, *tintColor;
    if (allColorBlock) {
        NSDictionary *allColorDict = allColorBlock(&onTintColor, &onBackgroundColor, &offTintColor, &offBackgroundColor, &tintColor);
        self.onTintColor = onTintColor;
        self.onBackgroundColor = onBackgroundColor;
        self.offTintColor = offTintColor;
        self.offBackgroundColor = offBackgroundColor;
        self.tintColor = tintColor;
        
        if (allColorDict) {
            //            [self setUpSafeColor:allColorDict[OnTintColor] writedColor:self.onTintColor];
            if (allColorDict[OnTintColor]) {
                self.onTintColor = allColorDict[OnTintColor];
            }
            //            [self setUpSafeColor:allColorDict[OnBackgroundColor] writedColor:self.onBackgroundColor];
            if (allColorDict[OnBackgroundColor]) {
                self.onBackgroundColor = allColorDict[OnBackgroundColor];
            }
            //            [self setUpSafeColor:allColorDict[OffTintColor] writedColor:self.offTintColor];
            if (allColorDict[OffTintColor]) {
                self.offTintColor = allColorDict[OffTintColor];
            }
            //            [self setUpSafeColor:allColorDict[OffBackgroundColor] writedColor:self.offBackgroundColor];
            
            if (allColorDict[OffBackgroundColor]) {
                self.offBackgroundColor = allColorDict[OffBackgroundColor];
            }
            //            [self setUpSafeColor:allColorDict[TintColor] writedColor:self.tintColor];
            if (allColorDict[TintColor]) {
                self.tintColor = allColorDict[TintColor];
            }
        }
    }
    [self setSwitchColorWithStatus:_on];
}

- (void)setUpSafeColor:(UIColor *)writeColor writedColor:(UIColor *)writedColor {
    if (writeColor) {
        writedColor = writeColor;
    }
}

- (void)setSwitchColorWithStatus:(BOOL)on {
    self.bottomView.backgroundColor = on ? _onBackgroundColor : _offBackgroundColor;
    self.topView.backgroundColor = on ? _onTintColor : _offTintColor;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setOn:!_on animated:YES];
}

// 开关开启状态的顶部滑块颜色 默认是灰色
- (void)setOnTintColor:(UIColor *)onTintColor {
    _onTintColor = onTintColor;
    [self setSwitchColorWithStatus:_on];
}

// 开关开启状态的底部背景颜色 默认是浅灰色
- (void)setOnBackgroundColor:(UIColor *)onBackgroundColor {
    _onBackgroundColor = onBackgroundColor;
    [self setSwitchColorWithStatus:_on];
}

// 开关关闭状态的顶部滑块颜色 默认是灰色
- (void)setOffTintColor:(UIColor *)offTintColor {
    _offTintColor = offTintColor;
    [self setSwitchColorWithStatus:_on];
}

// 开关关闭状态的底部背景颜色 默认是浅灰色
- (void)setOffBackgroundColor:(UIColor *)offBackgroundColor {
    _offBackgroundColor = offBackgroundColor;
    [self setSwitchColorWithStatus:_on];
}

// 开关的风格颜色 边框颜色 默认是无色
- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    self.topView.layer.borderColor = self.bottomView.layer.borderColor = tintColor.CGColor;
    self.topView.layer.borderWidth = self.bottomView.layer.borderWidth = 0.5f;
    [self setSwitchColorWithStatus:_on];
}

@end
