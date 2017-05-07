//
//  UIButton+Swizzling.m
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/6.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "UIButton+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation UIButton (Swizzling)
static const char *UIButton_collectionTarget = "UIButton_collectionTarget";
static const char *UIButton_isIgnore = "UIButton_isIgnore";
static const char *UIButton_timeInterval = "UIButton_timeInterval";

-(void)setCollectionTarget:(BOOL)collectionTarget
{
    objc_setAssociatedObject(self,UIButton_collectionTarget,@(collectionTarget),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)collectionTarget
{
    return [objc_getAssociatedObject(self,UIButton_collectionTarget) boolValue];
}
-(void)setIsIgnoreClick:(BOOL)isIgnoreClick
{
    objc_setAssociatedObject(self,UIButton_isIgnore,@(isIgnoreClick),OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(BOOL)isIgnoreClick
{
    return objc_getAssociatedObject(self,UIButton_isIgnore);
}
-(void)setAcceptInterval:(NSTimeInterval)acceptInterval
{
    objc_setAssociatedObject(self,UIButton_timeInterval,@(acceptInterval),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSTimeInterval)acceptInterval
{
    return [objc_getAssociatedObject(self,UIButton_timeInterval) doubleValue];
}
+(void)load
{
    [self methodSwizzlingWithOriginalSelector:@selector(sendAction:to:forEvent:) bySwizzledSelector:@selector(collectionTarget:to:forEvent:)];
}

-(void)collectionTarget:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.collectionTarget)
    {
        NSLog(@"在这里收集用户点击的行为,点击了:%@",self.currentTitle);
    }
    // 是否小于设定的时间间隔
    BOOL needSendAction = (NSDate.date.timeIntervalSince1970 - self.acceptInterval >= self.acceptInterval);
    // 更新上一次点击时间戳
    if (self.acceptInterval > 0) {
        self.acceptInterval = NSDate.date.timeIntervalSince1970;
    }
    // 两次点击的时间间隔小于设定的时间间隔时，才执行响应事件
    if (needSendAction) {
        [self collectionTarget:action to:target forEvent:event];
    }
}
@end
