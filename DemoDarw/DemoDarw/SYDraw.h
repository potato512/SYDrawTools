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
