//
//  NSObject+Swizzling.m
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/8.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzling)
+(void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                        bySwizzledSelector:(SEL)swizzledSelector{
    
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}
/*
 class_addMethod:会覆盖父类的方法实现。但不会取代本类中已存在的实现，如果本类中包含一个同名的实现，则函数返回NO。这里为源SEL添加IMP是为了避免源SEL没有实现IMP的情况。若添加成功则说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP；若添加失败则说明源SEL已经有IMP了，直接将两个SEL的IMP交换就可以了。
 class_replaceMethod：该函数的行为可以分为两种：如果类中不存在name指定的方法，则类似于clss_addMethod函数一样会添加方法；如果类中已存在name指定的方法，则类似于method_setImplementation一样代替原方法的实现。
 */

@end
