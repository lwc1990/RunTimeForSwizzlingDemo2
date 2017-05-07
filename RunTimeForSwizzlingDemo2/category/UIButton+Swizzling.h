//
//  UIButton+Swizzling.h
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/6.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Swizzling)
//是否收集点击信息
@property (nonatomic,assign) BOOL collectionTarget;
//防止用户反复点击一个按钮
//是否忽略此次点击
@property (nonatomic,assign) BOOL isIgnoreClick;
//设置点击间隔时间
@property (nonatomic,assign) NSTimeInterval acceptInterval;
@end
