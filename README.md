# WZBSwitch
实现了一个很简单的自定义开关控件
用法如下
  将WZBSwitch.h和WZBSwitch.m拖入工程
  在需要使用的地方调用
    /** 初始化方法
     *  switchValueChange: 开关状态改变回调block
     */
    WZBSwitch *switchView = [[WZBSwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 25) switchValueChanged:^(WZBSwitch *swith, BOOL on)     {
        // do someing
    }];
    [self.view addSubview:switchView];
    
   对于开关状态的监听或者您还可以通过代理：
   WZBSwitch *switchView = [[WZBSwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 25)];
   [self.view addSubview:switchView];
   // delegate
   switchView.delegate = self;
   
   然后实现代理方法即可
   #pragma mark - WZBSwitchDelegate
   - (void)switchValueChange:(WZBSwitch *)swith on:(BOOL)on {
        // do someing
   }
 ![image](https://github.com/WZBbiao/WZBSwitch/blob/master/WZBSwitch.gif?raw=true)
 您还可以加入我的群，大家庭期待您的加入！
 ![image](https://github.com/WZBbiao/WZBSwitch/blob/master/IMG_1850.jpg?raw=true)
