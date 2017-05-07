//
//  UIViewController+SWizzling_AddMethod.m
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/7.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "UIViewController+SWizzling_AddMethod.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation UIViewController (SWizzling_AddMethod)
+(void)load
{
    [self methodSwizzlingWithOriginalSelector: @selector(viewWillAppear:) bySwizzledSelector:@selector(myViewWillAppear:)];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}
-(void)myViewWillAppear:(BOOL)animated
{
    [self myViewWillAppear:animated];
    NSLog(@"myViewWillAppear");
}
@end
