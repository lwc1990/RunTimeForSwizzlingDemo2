//
//  NSObject+Swizzling.h
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/8.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+(void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;
@end
