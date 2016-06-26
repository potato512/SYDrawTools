//
//  ViewController.m
//  DemoDarw
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "SYDraw.h"
#import "SYDrawView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *vcArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"类别";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"draw" style:UIBarButtonItemStyleDone target:self action:@selector(drawClick:)];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setUI
{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.vcArray = @[];
    CGFloat originY = 10.0;
    for (int i = 0; i < self.vcArray.count; i++)
    {
        NSString *title = NSStringFromClass(self.vcArray[i]);
        CGRect rect = CGRectMake(10.0, originY, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0);
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = rect;
        button.backgroundColor = [UIColor colorWithRed:((arc4random() % 255) / 255.0) green:((arc4random() % 255) / 255.0) blue:((arc4random() % 255) / 255.0) alpha:((arc4random() % 10) / 10.0)];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        originY += (40.0 + 10.0);
    }
}

- (void)buttonClick:(UIButton *)button
{
    NSInteger index = button.tag;
    Class class = self.vcArray[index];
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)drawClick:(UIBarButtonItem *)item
{
    
//    SYDrawView *view = [[SYDrawView alloc] init];
//    view.frame = CGRectMake(10.0, 10.0, 100.0, 100.0);
    SYDrawView *view = [[SYDrawView alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];
    [self.view addSubview:view];
    view.drawType = DrawViewTypeLine;
    view.lineStart = CGPointMake(10.0, 10.0);
    view.lineEnd = CGPointMake(100.0, 10.0);
    view.colorRed = 120.0;
    view.colorGreen = 11.0;
    view.colorBlue = 1.0;
//    view.alphaDraw = 0.5;
//    [view setNeedsDisplay];
    
//    UIView *view = [SYDraw drawDashedLineWithFrame:CGRectMake(10.0, 10.0, 200.0, 1.0) lineLength:5.0 lineSpace:2.0 lineColor:[UIColor redColor]];    
//    [self.view addSubview:view];
    
//    [SYDraw drawCycleProgress:self.view frame:CGRectMake(10.0, 10.0, 100.0, 100.0) progress:0.3];
    

//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [self.view.layer addSublayer:shapeLayer];
//    shapeLayer.frame = CGRectMake(10.0, 10.0, 50.0, 50.0);
//    shapeLayer.backgroundColor = [UIColor brownColor].CGColor;
    

    
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10.0, 10.0, 60.0, 60.0) cornerRadius:10.0];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10.0, 10.0, 60.0, 60.0)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:30.0 startAngle:0.0 endAngle:(M_PI * 2) clockwise:YES];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [self.view.layer addSublayer:shapeLayer];
//    shapeLayer.path = path.CGPath;
//    shapeLayer.fillColor = [UIColor redColor].CGColor;
//    shapeLayer.strokeColor = [UIColor blackColor].CGColor;

    
    
    /*
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(170, 200);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];

    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
    

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;
    [layer addAnimation:animation forKey:@""];

    layer.strokeStart = 0.5;
    layer.strokeEnd = 0.5;
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation2.fromValue = @0.5;
    animation2.toValue = @0;
    animation2.duration = 2;
    
    CABasicAnimation *animation22 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation22.fromValue = @0.5;
    animation22.toValue = @1;
    animation22.duration = 2;
    [layer addAnimation:animation2 forKey:@""];
    [layer addAnimation:animation22 forKey:@""];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation3.fromValue = @1;
    animation3.toValue = @10;
    animation3.duration = 2;
    [layer addAnimation:animation3 forKey:@""];
    */

}



@end
