//
//  UnderLinedButton.m
//  Strayer
//
//  Created by user on 09/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "UnderLinedButton.h"

@implementation UnderLinedButton

- (void) drawRect:(CGRect)rect {
    CGRect textRect = self.titleLabel.frame;
    
    // need to put the line at top of descenders (negative value)
    CGFloat descender = self.titleLabel.font.descender;
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // set to same colour as text
    CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);
    
    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height);
    
    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height);
    
    CGContextClosePath(contextRef);
    
    CGContextDrawPath(contextRef, kCGPathStroke);
}

@end
