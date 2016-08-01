//
//  Dog.h
//  RuntimeDemo
//
//  Created by chocklee on 16/8/1.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject <NSCoding>

@property (nonatomic, copy) NSString *bone;
@property (nonatomic, copy) NSString *leg;

@end
