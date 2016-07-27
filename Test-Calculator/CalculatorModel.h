//
//  CalculatorModel.h
//  Test-Calculator
//
//  Created by decidion on 26.07.16.
//  Copyright © 2016 Decidion LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculatorModel : NSObject

@property (copy, nonatomic) NSString *operation;
@property (nonatomic) CGFloat currendOperand;
- (CGFloat)performOperand:(CGFloat)operand;

@end
