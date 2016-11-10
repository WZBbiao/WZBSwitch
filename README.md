# WZBSwitch
实现了一个很简单的自定义开关控件
用法如下

  将WZBSwitch.h和WZBSwitch.m拖入工程
  
  在需要使用的地方调用
  ```
    /** 初始化方法
     *  switchValueChange: 开关状态改变回调block
     */
    WZBSwitch *switchView = [[WZBSwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 25) switchValueChanged:^(WZBSwitch *swith, BOOL on)     {
        // do someing
    }];
    [self.view addSubview:switchView];
  ```
    
   对于开关状态的监听或者您还可以通过代理：
   
  ```
   WZBSwitch *switchView = [[WZBSwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 25)];
   [self.view addSubview:switchView];
   // delegate
   switchView.delegate = self;
  ```
   
   然后实现代理方法即可
   
  ```
   #pragma mark - WZBSwitchDelegate
   - (void)switchValueChange:(WZBSwitch *)swith on:(BOOL)on {
        // do someing
   }
  ```
   
   效果如下：
   
   
 ![image](https://github.com/WZBbiao/WZBSwitch/blob/master/WZBSwitch.gif?raw=true)
 
 如果您想自定义开关颜色，代码如下：
 
  // 设置所有颜色
  
  ```
    [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor,                UIColor *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
        // 可以通过这种方法设置需要设置的颜色
        *onTintColor = [UIColor redColor];
        *onBackgroundColor = [UIColor blueColor];
        *offTintColor = [UIColor greenColor];
        *offBackgroundColor = [UIColor grayColor];
        *tintColor = [UIColor blackColor];
        return nil;
    }];
  ```
    
  或者这样
  
  ```
  [switchView setUpAllColors:^NSDictionary *(UIColor *__autoreleasing *onTintColor, UIColor *__autoreleasing *onBackgroundColor, UIColor    *__autoreleasing *offTintColor, UIColor *__autoreleasing *offBackgroundColor, UIColor *__autoreleasing *tintColor) {
        // 也可以通过这种方法设置需要设置的颜色
        return @{OnTintColor : WZBColor(234, 67, 53), OnBackgroundColor : WZBColor(244, 161, 154), OffTintColor : WZBColor(255, 255,              255), OffBackgroundColor : WZBColor(214, 214, 214), TintColor : [UIColor colorWithRed:0.8252 green:0.8252 blue:0.8252                   alpha:1.0]};
    }];
  ```
 
 您还可以加入我们的群，大家庭期待您的加入！
 
 ![image](https://raw.githubusercontent.com/WZBbiao/WZBSwitch/master/IMG_1850.JPG)
