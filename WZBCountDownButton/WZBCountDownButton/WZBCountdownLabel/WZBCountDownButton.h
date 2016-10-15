//
//  WZBCountDownButton.h
//  WZBCountDownButton
//
//  Created by 王振标 on 2016/10/15.
//  Copyright © 2016年 王振标. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WZBCountDownButton;

// delegate
@protocol WZBCountDownButtonDelegate <NSObject>

@optional

//** 倒计时完成时调用 */
- (void)countdownSuccess:(WZBCountDownButton *)button;
//** 倒计时开始时调用 */
- (void)countdownBegin:(WZBCountDownButton *)button;

@end

//** 倒计时完成时调的block */
typedef void(^CountdownSuccessBlock)(WZBCountDownButton *button);
//** 倒计时开始时调的block */
typedef void(^CountdownBeginBlock)(WZBCountDownButton *button);

@interface WZBCountDownButton : UIButton

//** delegate */
@property (nonatomic, weak) id<WZBCountDownButtonDelegate> delegate;
//** 隐藏 */
+ (void)hidden;
//** 全是默认值的play方法 */
+ (instancetype)play;

//** number : 倒计时开始数字 */
+ (instancetype)playWithNumber:(NSInteger)number;
//** number : 倒计时开始数字；endTitle : 倒计时结束时显示的字符 */
+ (instancetype)playWithNumber:(NSInteger)number endTitle:(NSString *)endTitle;
//** number : 倒计时开始数字；success : 倒计时完成回调 */
+ (instancetype)playWithNumber:(NSInteger)number success:(CountdownSuccessBlock)success;
//** number : 倒计时开始数字；endTitle : 倒计时结束时显示的字符；success : 倒计时完成回调； */
+ (instancetype)playWithNumber:(NSInteger)number endTitle:(NSString *)endTitle success:(CountdownSuccessBlock)success;
//** number : 倒计时开始数字；endTitle : 倒计时结束时显示的字符；begin : 倒计时开始回调；success : 倒计时完成回调；*/
+ (instancetype)playWithNumber:(NSInteger)number endTitle:(NSString *)endTitle begin:(CountdownBeginBlock)begin success:(CountdownSuccessBlock)success;

//** number : 倒计时开始数字；endTitle : 倒计时结束时显示的字符；begin : 倒计时开始回调；success : 倒计时完成回调；*/
+ (instancetype)playWithImages:(NSArray *)images begin:(CountdownBeginBlock)begin success:(CountdownSuccessBlock)success;

+ (instancetype)playWithImages:(NSArray *)images duration:(NSTimeInterval)duration begin:(CountdownBeginBlock)begin success:(CountdownSuccessBlock)success;

//** 绑定代理 */
+ (void)addDelegate:(id<WZBCountDownButtonDelegate>)delegate;
//** 倒计时完成时的block监听 */
+ (void)addCountdownSuccessBlock:(CountdownSuccessBlock)success;
//** 倒计时开始时的block监听 */
+ (void)addCountdownBeginBlock:(CountdownBeginBlock)begin;
//** 倒计时开始时和结束时的block监听 */
+ (void)addCountdownBeginBlock:(CountdownBeginBlock)begin successBlock:(CountdownSuccessBlock)success;

@end
