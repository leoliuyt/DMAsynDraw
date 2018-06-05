//
//  ViewController.m
//  DMAsynDraw
//
//  Created by lbq on 2018/5/28.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import "DMAsynDisplayView.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) DMAsynDisplayView *asynDisplayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.asynDisplayView = [[DMAsynDisplayView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.asynDisplayView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.asynDisplayView];
    
    [self.asynDisplayView setNeedsDisplay];
    
}

- (IBAction)pressAction:(id)sender
{
    self.asynDisplayView.frame = CGRectMake(10, 30, 100, 100);
    [self.asynDisplayView setNeedsDisplay];
//    [self.asynDisplayView.layer setNeedsDisplay];
//    [self.asynDisplayView.layer display];
}

- (void)test1
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        [self.timer fire];
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)timerAction:(id)sender
{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (void)imageDecode
//{
//    //    UIImage *image = [UIImage imageNamed:@"check_green"];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"black@2x" ofType:@"png"];
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    CFDataRef rawData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));//158400 bytes = 198*200*4
//
//    //在将磁盘中的图片渲染到屏幕之前，必须先要得到图片的原始像素数据，才能执行后续的绘制操作，这就是为什么需要对图片解压缩的原因。
//    CGImageRef imageRef = image.CGImage;
//    CGImageRef decodedImageRef = YYCGImageCreateDecodedCopy(imageRef, YES);
//    UIImage *imageWithoutAlpha = [UIImage imageWithCGImage:decodedImageRef
//                                                     scale:image.scale
//                                               orientation:image.imageOrientation];
//    CFDataRef decodedRawData = CGDataProviderCopyData(CGImageGetDataProvider(imageWithoutAlpha.CGImage));
//    NSLog(@"%@",image);
//}
//
//CGImageRef YYCGImageCreateDecodedCopy(CGImageRef imageRef, BOOL decodeForDisplay) {
//    if (!imageRef) return NULL;
//    size_t width = CGImageGetWidth(imageRef);
//    size_t height = CGImageGetHeight(imageRef);
//    if (width == 0 || height == 0) return NULL;
//
//    if (decodeForDisplay) { //decode with redraw (may lose some precision)
//        CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef) & kCGBitmapAlphaInfoMask;
//        BOOL hasAlpha = NO;
//        if (alphaInfo == kCGImageAlphaPremultipliedLast ||
//            alphaInfo == kCGImageAlphaPremultipliedFirst ||
//            alphaInfo == kCGImageAlphaLast ||
//            alphaInfo == kCGImageAlphaFirst) {
//            hasAlpha = YES;
//        }
//        // BGRA8888 (premultiplied) or BGRX8888
//        // same as UIGraphicsBeginImageContext() and -[UIView drawRect:]
//        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
//        bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
//        CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, 0, CGColorSpaceCreateDeviceRGB(), bitmapInfo);
//        if (!context) return NULL;
//        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef); // decode
//        CGImageRef newImage = CGBitmapContextCreateImage(context);
//        CFRelease(context);
//        return newImage;
//
//    } else {
//        CGColorSpaceRef space = CGImageGetColorSpace(imageRef);
//        size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
//        size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
//        size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
//        CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
//        if (bytesPerRow == 0 || width == 0 || height == 0) return NULL;
//
//        CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
//        if (!dataProvider) return NULL;
//        CFDataRef data = CGDataProviderCopyData(dataProvider); // decode
//        if (!data) return NULL;
//
//        CGDataProviderRef newProvider = CGDataProviderCreateWithCFData(data);
//        CFRelease(data);
//        if (!newProvider) return NULL;
//
//        CGImageRef newImage = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, newProvider, NULL, false, kCGRenderingIntentDefault);
//        CFRelease(newProvider);
//        return newImage;
//    }
//}

@end
