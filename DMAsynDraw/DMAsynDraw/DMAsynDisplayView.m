//
//  DMAsynDisplayView.m
//  DMAsynDraw
//
//  Created by lbq on 2018/6/4.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMAsynDisplayView.h"
#import "DMAsynDisplayLayer.h"
@interface DMAsynDisplayView()<CALayerDelegate>
@end
@implementation DMAsynDisplayView
- (instancetype)init
{
    self = [super init];
    self.layer.delegate = self;
    return self;
}
//- (CALayer *)layer
//{
//    return (CALayer *)[DMAsynDisplayLayer class];
//}

+ (Class)layerClass
{
    return [DMAsynDisplayLayer class];
}

- (void)displayLayer:(CALayer *)layer
{
    NSLog(@"displayLayer");
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"%s",__func__);
}
@end
