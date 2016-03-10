//
//  ImageFilter.m
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ImageFilter.h"

@implementation ImageFilter

@synthesize component;

- (id) initWithImageComponent:(id<ImageComponent>)component1
{
    if(self = [super init])
    {
        //保存 ImageComponent
        self.component = component1;
    }
    return self;
}

- (void) apply
{
    //由子类重载，应用真正的滤镜
}

- (id) forwardingTargetForSelector:(SEL)aSelector
{
    NSString *selectorName = NSStringFromSelector(aSelector);
    if([selectorName hasPrefix:@"draw"])
    {
        [self apply];
    }
    return  self.component;
}




@end
