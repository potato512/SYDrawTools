//
//  ViewController.m
//  DemoDarw
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "SYDraw.h"

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
//    UIView *view = [SYDraw drawDashedLineWithFrame:CGRectMake(10.0, 10.0, 200.0, 1.0) lineLength:5.0 lineSpace:2.0 lineColor:[UIColor redColor]];    
//    [self.view addSubview:view];
    
//    [SYDraw drawCycleProgress:self.view frame:CGRectMake(10.0, 10.0, 100.0, 100.0) progress:0.3];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [self.view.layer addSublayer:shapeLayer];
    shapeLayer.frame = CGRectMake(10.0, 10.0, 50.0, 50.0);
    shapeLayer.backgroundColor = [UIColor brownColor].CGColor;
}



@end
