//
//  ViewController.m
//  Design
//
//  Created by tree on 16/3/7.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ViewController.h"

@interface NSString(printfStirng)

- (void) printfString;

@end

@implementation NSString(printfStirng)

- (void)printfString
{
    NSLog(@"%@",self);
}

@end


#define Number_Array (@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"])

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *itemDisplay;

@end

@implementation ViewController

/**
 *  NSEnumerator
 *
 */
- (IBAction)enumeratorPress:(id)sender {
    self.itemDisplay.text = @"";
    NSEnumerator *enumerator = [Number_Array objectEnumerator];
    NSString *item;
    while (item = [enumerator nextObject]) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.15]];
        self.itemDisplay.text = [NSString  stringWithFormat:@"%@ - %@",self.itemDisplay.text,item];
    }
    
}

/**
 *  基于块的枚举
 *
 * */
- (IBAction)blockPress:(id)sender {
    
    [Number_Array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%d , %d",idx,*stop);
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.15]];
        self.itemDisplay.text = [NSString  stringWithFormat:@"%@ - %@",self.itemDisplay.text,obj];
    }];
    
}

/**
 *  快速枚举
 *
 */
- (IBAction)quickPress:(id)sender {
    
    for (NSString *item in Number_Array) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.15]];
        self.itemDisplay.text = [NSString  stringWithFormat:@"%@ - %@",self.itemDisplay.text,item];
    }
    
}

/**
 *  内部枚举
 *
 */
- (IBAction)innerPress:(id)sender {

    [Number_Array makeObjectsPerformSelector:@selector(printfString)];
    
}

@end
