//
//  NSObject+Extension.h
//  RuntimeDemo
//
//  Created by chocklee on 16/8/1.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSArray *)ignoredNames;

- (void)decode:(NSCoder *)aDecoder;

- (void)encode:(NSCoder *)aCoder;

@end
