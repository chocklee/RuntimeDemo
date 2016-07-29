//
//  NSObject+Category.m
//  RuntimeDemo
//
//  Created by chocklee on 16/7/29.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

char classNameKey;

- (void)setClassName:(NSString *)className {
    objc_setAssociatedObject(self, &classNameKey, className, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)className {
    return objc_getAssociatedObject(self, &classNameKey);
}

@end
