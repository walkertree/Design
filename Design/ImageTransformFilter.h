//
//  ImageTransformFilter.h
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ImageFilter.h"

@interface ImageTransformFilter : ImageFilter

@property (nonatomic,assign) CGAffineTransform transform;

- (id) initWithImageComponent:(id<ImageComponent>)component
                    transform:(CGAffineTransform) transform;

- (void) apply;

@end
