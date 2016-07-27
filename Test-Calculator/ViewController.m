//
//  ViewController.m
//  Test-Calculator
//
//  Created by decidion on 26.07.16.
//  Copyright © 2016 Decidion LLC. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UIProgressView *pv;
@property (strong, nonatomic) IBOutlet UISwitch *sw;
@property (strong, nonatomic) CalculatorModel *model;
@property (nonatomic) BOOL waitNextOperand;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.model = [[CalculatorModel alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClearPressed:(UIButton *)sender
{
    self.valueLabel.text = @"0";
    self.model.operation = nil;
}

- (IBAction)onEqualPressed:(UIButton *)sender
{
    CGFloat value = [self.model performOperand:self.valueLabel.text.floatValue];
    self.valueLabel.text = [NSString stringWithFormat:@"%f",value];
    self.model.currendOperand = value;
}

- (IBAction)onOperationPressed:(UIButton *)sender
{
    self.model.operation = sender.titleLabel.text;
    self.model.currendOperand = self.valueLabel.text.floatValue;
    self.waitNextOperand = YES;
}

- (IBAction)onOperandPressed:(UIButton *)sender
{
    NSString *value = self.valueLabel.text;
    if([value isEqualToString:@"0"] || self.waitNextOperand)
    {
        value = @"";
        self.waitNextOperand = NO;
    }
    value = [value stringByAppendingString:sender.titleLabel.text];
    self.valueLabel.text = value;
}
- (IBAction)onSlider:(UISlider *)sender
{
    float status = sender.value;
    if(self.sw.isOn)
    self.pv.progress = status;
    self.valueLabel.text = [NSString stringWithFormat:@"%f",status];
}

@end
