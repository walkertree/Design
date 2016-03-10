//
//  ImageTransformFilter.m
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter

- (id) initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transform
{
    if(self = [super initWithImageComponent:component])
    {
        self.transform = transform;
    }
    return self;
}

- (void) apply
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置变换
    CGContextConcatCTM(context, self.transform);
}

@end
