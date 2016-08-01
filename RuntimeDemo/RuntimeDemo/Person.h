//
//  Person.h
//  RuntimeDemo
//
//  Created by chocklee on 16/7/29.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, assign) NSUInteger age;

+ (void)run;

+ (void)study;

@end
