//
//  DecoratorView.m
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "DecoratorView.h"

@implementation DecoratorView

- (void) drawRect:(CGRect)rect
{
    [self.image drawInRect:rect];
    
}

@end
