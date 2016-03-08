//
//  ViewController.m
//  Design
//
//  Created by tree on 16/3/7.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ViewController.h"

#define Number_Array (@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"])

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *itemDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)enumeratorPress:(id)sender {
    self.itemDisplay.text = @"";
    NSEnumerator *enumerator = [Number_Array objectEnumerator];
    NSString *item;
    while (item = [enumerator nextObject]) {
        
    }
    
}

- (IBAction)blockPress:(id)sender {
}

- (IBAction)quickPress:(id)sender {
}

- (IBAction)innerPress:(id)sender {
}

@end
