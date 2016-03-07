//
//  ViewController.m
//  Design
//
//  Created by tree on 16/3/7.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ViewController.h"
#include <QuartzCore/CoreAnimation.h>
#include <Foundation/Foundation.h>

typedef enum
{
    ShapeType_Circle = 0,
    ShapeType_Square
}
ShapeType;


#pragma mark ---  工厂类  ---
@interface Shape : NSObject

@property (nonatomic, assign) CGRect frame;

- (id) initWithFrame:(CGRect)frame;

- (void) showInLayer:(CALayer *)layer;

@end

@implementation Shape

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super init])
    {
        self.frame = frame;
    }
    return self;
}


- (void) showInLayer:(CAShapeLayer *)layer
{
    
}

@end


#pragma mark ---  工厂生产的子类 —— 圆形、方形  ---

@interface Circle : Shape

@end

@implementation Circle

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
    }
    return self;
}

- (void) showInLayer:(CAShapeLayer *)layer
{
    CGPoint center = CGPointMake(self.frame.origin.x + self.frame.size.width / 2,
                                 self.frame.origin.y + self.frame.size.height / 2);
    
    CGFloat startAngel = 0;
    CGFloat endAngel = M_PI * 2;
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:self.frame.size.width / 2
                                                    startAngle:startAngel
                                                      endAngle:endAngel
                                                     clockwise:YES];
    
    layer.path = path.CGPath;
    
}


@end




@interface Square : Shape

@end

@implementation Square

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
    }
    return self;
}

- (void) showInLayer:(CAShapeLayer *)layer
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.frame];
    layer.path = path.CGPath;
}

@end



#pragma mark ---   显示界面  ---

@interface ViewController ()

@property (nonatomic, strong) CAShapeLayer *layer;

@property (nonatomic, assign) CGRect rect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    self.rect = CGRectMake((self.view.frame.size.width - width) / 2,
                           (self.view.frame.size.height - width) / 2,
                           width,
                           width);

    self.layer = [CAShapeLayer layer];
    self.layer.fillColor = [UIColor clearColor].CGColor;
    self.layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.layer];

}


- (Shape *) getShapeClass:(ShapeType)shapeType
{
    Shape *temp = nil;
    switch (shapeType) {
        case ShapeType_Square:
        {
            temp = [[Square alloc] initWithFrame:self.rect];
        }
            break;
        case ShapeType_Circle:
        {
            temp = [[Circle alloc] initWithFrame:self.rect];
        }
            break;
            
        default:
            break;
    }
    return temp;
}

- (void) addAnimation1
{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    animation.duration = 1;
    
    [self.layer addAnimation:animation forKey:@""];
}

- (void) addAnimation2
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:5.f];
    animation.duration = 1;
    
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.fromValue = [NSNumber numberWithFloat:0.0f];
    animation2.toValue = [NSNumber numberWithFloat:1.0f];
    animation2.duration = 1;
    
    [self.layer addAnimation:animation forKey:@""];
    [self.layer addAnimation:animation2 forKey:@""];
}



- (IBAction)circle:(id)sender {
    [self addAnimation1];
    [[self getShapeClass:ShapeType_Circle] showInLayer:self.layer];
}


- (IBAction)square:(id)sender {
     [self addAnimation2];
     [[self getShapeClass:ShapeType_Square] showInLayer:self.layer];
}
@end
