//
//  DMAsynDisplayLayer.m
//  DMAsynDraw
//
//  Created by lbq on 2018/6/4.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMAsynDisplayLayer.h"

@implementation DMAsynDisplayLayer

- (void)drawInContext:(CGContextRef)ctx
{
    [super drawInContext:ctx];
//    self.frame = CGRectMake(40, 60, 100, 100);
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
}
- (void)display
{
    [super display];
}
@end
