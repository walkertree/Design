//
//  ViewController.m
//  Design
//
//  Created by tree on 16/3/7.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ViewController.h"
#import "ImageTransformFilter.h"
#import "ImageShadowFilter.h"
#import "DecoratorView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DecoratorView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"555.jpg"];

    //创建一个变化
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI / 4.0);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width / 2.0,
                                                                            image.size.height / 8.0);
    CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
    
    //真正的子类的方式
    id<ImageComponent> transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image
                                                                                     transform:finalTransform];
    
    id<ImageComponent> finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
    
    self.imageView.image = finalImage;
}




@end
