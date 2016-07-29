//
//  ViewController.m
//  RuntimeDemo
//
//  Created by chocklee on 16/7/29.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "UIImage+Category.h"
#import "NSObject+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

// 一、交换两个方法的实现，拦截系统自带的方法调用功能
#pragma mark - 方法的简单交换
    // 获得类的两个方法
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(study));
    // 开始方法交换
    method_exchangeImplementations(m1, m2);
    
    [Person run];
    [Person study];
    
#pragma mark - 拦截系统方法
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"哈密瓜"];
    [self.view addSubview:imageView];
    
// 二、在分类中设置属性，给任何一个对象设置属性
#pragma mark - 给类目添加属性
    Person *person = [[Person alloc] init];
    person.className = @"Person";
    NSLog(@"%@",person.className);

// 三、获得一个类的所有成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIViewController class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s，成员变量类型：%s", name, type);
    }
    // 释放内存
    free(ivars);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
