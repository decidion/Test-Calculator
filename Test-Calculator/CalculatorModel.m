//
//  CalculatorModel.m
//  Test-Calculator
//
//  Created by decidion on 26.07.16.
//  Copyright © 2016 Decidion LLC. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

- (CGFloat)performOperand:(CGFloat)operand
{
    CGFloat value = self.currendOperand;
    
    if([self.operation isEqualToString:@"X"])
    {
        value *= operand;
    }
    else if([self.operation isEqualToString:@"/"])
    {
        value /= operand;
    }
    else if([self.operation isEqualToString:@"+"])
    {
        value += operand;
    }
    else if([self.operation isEqualToString:@"-"])
    {
        value -= operand;
    }
    
    return value;
}

@end
