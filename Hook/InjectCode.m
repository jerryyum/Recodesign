//
//  InjectCode.m
//  Hook
//
//  Created by miao yu on 2019/10/18.
//  Copyright © 2019 jerryyum. All rights reserved.
//

#import "InjectCode.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

//@class WCAccountMainLoginViewController;
//@class WCAccountTextFieldItem;
//@class WCUITextField;
// 上面这样声明还是报错


@implementation InjectCode

+ (void)load {
    // 破坏注册
    Method oldMethod1 = class_getInstanceMethod(objc_getClass("WCAccountLoginControlLogic"), @selector(onFirstViewRegister));
    Method newMethod1 = class_getInstanceMethod(self, @selector(hk_onFirstViewRegister));
    method_exchangeImplementations(oldMethod1, newMethod1);
    
}

- (void)hk_onFirstViewRegister {
    NSLog(@"***恶意代码注入成功，无法注册！***");
}

@end
