//
//  Person.m
//  RuntimeDemo
//
//  Created by chocklee on 16/7/29.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (void)run {
    NSLog(@"跑");
}

+ (void)study {
    NSLog(@"学习");
}

- (NSArray *)ignoreNames {
    return @[@"age"];
}

// 解档方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        // 获取所有成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            // 将每个成员变量名转换为NSString对象类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            // 忽略不需要解档的属性
            if ([[self ignoreNames] containsObject:key]) {
                continue;
            }
            // 根据变量名解档取值，无论什么类型
            id value = [aDecoder decodeObjectForKey:key];
            // 取出的值再设置给属性
            [self setValue:value forKey:key];
            // 这两步相当于 self.age = [aDecoder decodeObjectForKey:@"_age"];
        }
        free(ivars);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    // 获取所有成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 忽略不需要解档的属性
        if ([[self ignoreNames] containsObject:key]) {
            continue;
        }
        // 通过成员变量名，取出成员变量的值
        id value = [self valueForKeyPath:key];
        // 再将值归档
        [aCoder encodeObject:value forKey:key];
        // 这两步相当于 [aCoder encodeObject:@(self.age) forKey:@"_age"];
    }
    free(ivars);
}

@end
