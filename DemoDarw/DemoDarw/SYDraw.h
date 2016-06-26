//
//  SYDrawTools.h
//  DemoDarw
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SYDraw : NSObject

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
+ (UIView *)drawDashedLineWithFrame:(CGRect)frame lineLength:(CGFloat)length lineSpace:(CGFloat)space lineColor:(UIColor *)color;

+ (void)drawCycleProgress:(UIView *)view frame:(CGRect)frame progress:(CGFloat)progress;

@end


/*
http://www.cocoachina.com/ios/20160214/15251.html
 
 怎么画曲线
 贝塞尔曲线的画法是由起点、终点、控制点三个参数来画的，为了解释清楚这个点，我写了几行代码来解释它
 
 let startPoint = CGPointMake(50, 300)
 let endPoint = CGPointMake(300, 300)
 let controlPoint = CGPointMake(170, 200)
 
 let layer1 = CALayer()
 layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5)
 layer1.backgroundColor = UIColor.redColor().CGColor
 
 let layer2 = CALayer()
 layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5)
 layer2.backgroundColor = UIColor.redColor().CGColor
 
 let layer3 = CALayer()
 layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5)
 layer3.backgroundColor = UIColor.redColor().CGColor
 
 let path = UIBezierPath()
 let layer = CAShapeLayer()
 
 path.moveToPoint(startPoint)
 path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
 
 layer.path = path.CGPath
 layer.fillColor = UIColor.clearColor().CGColor
 layer.strokeColor = UIColor.blackColor().CGColor
 
 view.layer.addSublayer(layer)
 view.layer.addSublayer(layer1)
 view.layer.addSublayer(layer2)
 view.layer.addSublayer(layer3)
 我很随意的定义了三个点，为了清楚显示它们的位置，我放了三个矩形在上面以便观察，然后调用 path.moveToPoint(startPoint) 让它移动到起始点，然后调用path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint) 这个方法告诉它结束点和控制点，这样它就能画出一条有弧度的线条了，如果把fillColor设置一个颜色，那么它就会变成一个很丑的形状了
 
 控制点决定了它的曲率，曲线的顶点不等于控制点的位置，具体可以看一下贝塞尔曲线的定义，你还可以使用两个控制点来画，两个控制点可以使用方法 path.addCurveToPoint(endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint2)来搞定
 
 再来说说 CAShapeLayer
 CAShapeLayer 是个神奇的东西，给它一个path它就能变成你想要的形状，它还有很多可以玩的地方。综合使用可以组合成不同的动画，比如下面这样
 这三个动画就是使用了 strokeEnd、strokeStart和lineWidth 三个属性，第一个动画用了strokeEnd这个属性的值范围是0-1，动画显示了从0到1之间每一个值对这条曲线的影响，strokeStart的方法则是相反的，如果把这两个值首先都设置成0.5然后慢慢改变成0和1的时候就会变成第二个动画，配合lineWidth则曲线会慢慢变粗，这里的很多属性都是支持动画的。
 
 
*/
