//
//  ImageComponent.h
//  Design
//
//  Created by jiangshu-fu on 16/3/9.
//  Copyright © 2016年 tree. All rights reserved.
//

#ifndef ImageComponent_h
#define ImageComponent_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol ImageComponent <NSObject>

@optional
- (void)drawAtPoint:(CGPoint)point;
- (void)drawAtPoint:(CGPoint)point
          blendMode:(CGBlendMode)blendMode
              alpha:(CGFloat)alpha;

- (void)drawInRect:(CGRect)rect;
- (void)drawInRect:(CGRect)rect
         blendMode:(CGBlendMode)blendMode
             alpha:(CGFloat)alpha;

- (void)drawAsPatternInRect:(CGRect)rect;


@end


#endif /* ImageComponent_h */
