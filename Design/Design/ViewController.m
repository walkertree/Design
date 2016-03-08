//
//  ViewController.m
//  Design
//
//  Created by tree on 16/3/7.
//  Copyright © 2016年 tree. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *numberText;

@property (weak, nonatomic) IBOutlet UIPickerView *dataPinckView;
@property (nonatomic,strong) NSNumber *selectRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectRow = [NSNumber numberWithInt:0];
    [self addObserver:self
           forKeyPath:@"selectRow"
              options:NSKeyValueObservingOptionNew
              context:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - ---  UIPickerViewDataSource  ---
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d",row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectRow = [NSNumber numberWithInteger:row];
}


#pragma  mark - ---  被观察者改变响应函数  ---
- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary<NSString *,id> *)change
                        context:(void *)context
{
    if([keyPath isEqualToString:@"selectRow"])
    {
        NSInteger selectRow = [[change objectForKey:NSKeyValueChangeNewKey] integerValue];
        self.numberText.text = [NSString stringWithFormat:@"%d",selectRow];
    }
}

@end
