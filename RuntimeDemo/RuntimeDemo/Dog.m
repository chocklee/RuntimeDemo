//
//  Dog.m
//  RuntimeDemo
//
//  Created by chocklee on 16/8/1.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "Dog.h"
#import "NSObject+Extension.h"

@implementation Dog

- (NSArray *)ignoredNames {
    return @[@"bone"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encodeWithCoder:aCoder];
}

@end
