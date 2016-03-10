//
//  ImageFilter.h
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+ImageComponent.h"

@interface ImageFilter : NSObject <ImageComponent>
{
}

@property (nonatomic, retain) id<ImageComponent> component;

- (void) apply;
- (id) initWithImageComponent:(id<ImageComponent>)component;
- (id) forwardingTargetForSelector:(SEL)aSelector;

@end
