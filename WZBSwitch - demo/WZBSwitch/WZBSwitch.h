//
//  WZBSwitch.h
//  自定义开关
//
//  Created by WZB on 16/7/27.
//  Copyright © 2016年 王振标. All rights reserved.
//


#import <UIKit/UIKit.h>

// All Keys
static NSString *const OnTintColor = @"OnTintColor";
static NSString *const OnBackgroundColor = @"OnBackgroundColor";
static NSString *const OffTintColor = @"OffTintColor";
static NSString *const OffBackgroundColor = @"OffBackgroundColor";
static NSString *const TintColor = @"TintColor";

@class WZBSwitch;

typedef void(^SwitchValueChangeBlock)(WZBSwitch *swith, BOOL on);

@protocol WZBSwitchDelegate <NSObject>

@optional
- (void)switchValueChange:(WZBSwitch *)swith on:(BOOL)on;

@end

@interface WZBSwitch : UIView
/** 开关开启状态的顶部滑块颜色 默认是白色 */
@property (nonatomic, strong) UIColor *onTintColor;
/** 开关开启状态的底部背景颜色 默认是绿色 */
@property (nonatomic, strong) UIColor *onBackgroundColor;
/** 开关关闭状态的顶部滑块颜色 默认是白色 */
@property (nonatomic, strong) UIColor *offTintColor;
/** 开关关闭状态的底部背景颜色 默认是白色 */
@property (nonatomic, strong) UIColor *offBackgroundColor;
/** 开关的风格颜色 边框颜色 默认是亮灰色 */
@property(nonatomic, strong) UIColor *tintColor;
/** 查看开关打开状态, 默认为关闭 */
@property (nonatomic, readonly, getter=isOn) BOOL on;
/** 开关状态改变回调block */
@property (nonatomic, copy) SwitchValueChangeBlock switchValueChange;
/** delegate */
@property (nonatomic, weak) id <WZBSwitchDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame switchValueChanged:(SwitchValueChangeBlock)switchValueChange;
/** 一个方法设置所有颜色 */
- (void)setUpAllColors:(NSDictionary *(^)(UIColor **onTintColor,UIColor **onBackgroundColor, UIColor **offTintColor, UIColor **offBackgroundColor, UIColor **tintColor))allColorBlock;
/** 一个方法设置所有颜色 && block回调
 *  switchValueChange: 开关状态改变回调block
 */
- (void)setUpAllColors:(NSDictionary *(^)(UIColor **onTintColor,UIColor **onBackgroundColor, UIColor **offTintColor, UIColor **offBackgroundColor, UIColor **tintColor))allColorBlock switchValueChanged:(SwitchValueChangeBlock)switchValueChange;
/** 设置开关状态, animated : 是否有动画 */
- (void)setOn:(BOOL)newOn animated:(BOOL)animated;

@end
