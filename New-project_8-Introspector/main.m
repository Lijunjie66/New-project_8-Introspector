//
//  main.m
//  New-project_8-Introspector
//
//  Created by Geraint on 2018/4/8.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 定义了一个 1号测试类 Greeter类
@interface Greeter : NSObject
@property (readwrite,strong) NSString *salutation;
- (NSString *)greeting:(NSString *)recipient;
@end

@implementation Greeter
- (NSString *)greeting:(NSString *)recipient {
    return [NSString stringWithFormat:@"%@ %@",[self salutation],recipient];
}
@end


int main(int argc, char * argv[]) {
    @autoreleasepool {
        Greeter *greeter = [[Greeter alloc]init];
        [greeter setSalutation:@"Hello"];
        
        // 内省：实现方法 和 遵循协议
        /*
         方法实现和协议遵循
         
         NSObject还有两个功能更加强大的内省方法，即respondsToSelector:和conformsToProtocol:。这两个方法分别告诉您一个对象是否实现特定的方法，以及是否遵循指定的正式协议（即该对象是否采纳了该协议，且实现了该协议的所有方法）。
         */
        if ([greeter respondsToSelector:@selector(greeting:)] && [greeter conformsToProtocol:@protocol(NSObject)]) {
            id result = [greeter performSelector:@selector(greeting:)
                                      withObject:@"Monster!"];
            NSLog(@"%@",result);
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
