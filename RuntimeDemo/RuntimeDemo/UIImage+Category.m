//
//  UIImage+Category.m
//  RuntimeDemo
//
//  Created by chocklee on 16/7/29.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

@implementation UIImage (Category)

+ (void)load {
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(cl_imageNamed:));
    method_exchangeImplementations(m1, m2);
}

+ (UIImage *)cl_imageNamed:(NSString *)name {
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        name = [name stringByAppendingString:@"_os7"];
        NSLog(@"%@",name);
    }
    /**
     *   注意：自定义方法中最后一定要再调用一下系统的方法，让其有加载图片的功能，但是由于方法交换，系统的方法名已经变成了我们自定义的方法名（有点绕，就是用我们的名字能调用系统的方法，用系统的名字能调用我们的方法），这就实现了系统方法的拦截！
     */
    return [UIImage cl_imageNamed:name];
}

@end
