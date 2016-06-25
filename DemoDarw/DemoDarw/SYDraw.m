//
//  SYDrawTools.m
//  DemoDarw
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "SYDraw.h"

@implementation SYDraw

/**
 *  绘制虚线
 *
 *  @param frame  原点尺寸
 *  @param length 线长
 *  @param space  间距
 *  @param color  线条颜色
 *
 *  @return view 对象
 */
+ (UIView *)drawDashedLineWithFrame:(CGRect)frame lineLength:(CGFloat)length lineSpace:(CGFloat)space lineColor:(UIColor *)color
{
    UIView *dashedLine = [[UIView alloc] initWithFrame:frame];
    dashedLine.backgroundColor = [UIColor clearColor];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(dashedLine.frame), 0);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = dashedLine.bounds;
    shapeLayer.position = CGPointMake(CGRectGetWidth(dashedLine.frame) / 2, CGRectGetHeight(dashedLine.frame));
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.lineWidth = CGRectGetHeight(dashedLine.frame);
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineDashPattern = @[@(length), @(space)];
    shapeLayer.path = path;
    
    CGPathRelease(path);
    
    [dashedLine.layer addSublayer:shapeLayer];
    return dashedLine;
}

+ (void)drawCycleProgress:(UIView *)view frame:(CGRect)frame progress:(CGFloat)progress
{
    CAShapeLayer *trackLayer = [CAShapeLayer layer];
    [view.layer addSublayer:trackLayer];
    trackLayer.fillColor = nil;
    trackLayer.strokeColor = [UIColor greenColor].CGColor;
    trackLayer.frame = frame;
    
    CAShapeLayer *progressLayer = [CAShapeLayer new];
    [view.layer addSublayer:progressLayer];
    progressLayer.fillColor = nil;
    progressLayer.strokeColor = [UIColor redColor].CGColor;
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.frame = frame;
    
    // 默认5
    CGFloat progressWidth = 10.0;
    
    UIBezierPath *trackPath = [UIBezierPath bezierPathWithArcCenter:view.center radius:(frame.size.width - progressWidth)/ 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];;
    trackLayer.path = trackPath.CGPath;

    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:view.center radius:(frame.size.width - progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * progress - M_PI_2 clockwise:YES];
    progressLayer.path = progressPath.CGPath;
}

+ (void)drawBlackSquare:(UIView *)view frame:(CGRect)frame
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [view.layer addSublayer:shapeLayer];
    shapeLayer.frame = frame;
    shapeLayer.backgroundColor = [UIColor brownColor].CGColor;
}


/*
 
 图形上下是一个CGContextRef类型的数据。
 图形上下文包含：
 1，绘图路径（各种各样图形）
 2，绘图状态（颜色，线宽，样式，旋转，缩放，平移）
 3，输出目标（绘制到什么地方去？UIView、图片）
 
 1，获取当前图形上下文
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 2，添加线条
 CGContextMoveToPoint(ctx, 20, 20);
 3，渲染
 CGContextStrokePath(ctx);
 CGContextFillPath(ctx);
 4，关闭路径
 CGContextClosePath(ctx);
 5，画矩形
 CGContextAddRect(ctx, CGRectMake(20, 20, 100, 120));
 6，设置线条颜色
 [[UIColor redColor] setStroke];
 7， 设置线条宽度
 CGContextSetLineWidth(ctx, 20);
 8，设置头尾样式
 CGContextSetLineCap(ctx, kCGLineCapSquare);
 9，设置转折点样式
 CGContextSetLineJoin(ctx, kCGLineJoinBevel);
 10，画圆
 CGContextAddEllipseInRect(ctx, CGRectMake(30, 50, 100, 100));
 11，指定圆心
 CGContextAddArc(ctx, 100, 100, 50, 0, M_PI * 2, 1);
 12，获取图片上下文
 UIGraphicsGetImageFromCurrentImageContext();
 13，保存图形上下文
 CGContextSaveGState(ctx)
 14，恢复图形上下文
 CGContextRestoreGState(ctx)
 
 */



@end
