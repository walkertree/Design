//
//  ImageShadowFilter.m
//  Design
//
//  Created by tree on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter


- (void) apply
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置变换
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20.0f);
}


- (void) drawInRect:(CGRect)rect
{
    [self apply];
    [self.component drawInRect:rect];
}


@end
