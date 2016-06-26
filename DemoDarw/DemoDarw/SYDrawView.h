//
//  SYDrawView.h
//  DemoDarw
//
//  Created by herman on 16/6/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 绘图类型（画线（实线，或虚线）、画圆、画矩形、）
typedef NS_ENUM(NSInteger, DrawViewType)
{
    /// 绘图类型-画线（实线，或虚线）
    DrawViewTypeLine = 0,
    
};

@interface SYDrawView : UIView


/// 绘图类型（画线（实线，或虚线）、画圆、画矩形、）
@property (nonatomic, assign) DrawViewType drawType;



/// 画线-线条样式（实线，或虚线）
@property (nonatomic, assign) BOOL isSolidLine;
/// 画线-线条透明度（0.0 ~ 1.0）
@property (nonatomic, assign) CGFloat alphaDraw;
/// 画线-线条红色十六进制值（0.0 ~ 255.0）
@property (nonatomic, assign) int colorRed;
/// 画线-线条蓝色十六进制值（0.0 ~ 255.0）
@property (nonatomic, assign) int colorBlue;
/// 画线-线条绿色十六进制值（0.0 ~ 255.0）
@property (nonatomic, assign) int colorGreen;
/// 画线-线条宽度
@property (nonatomic, assign) float lineWidth;
/// 画线-起点
@property (nonatomic, assign) CGPoint lineStart;
/// 画线-终点
@property (nonatomic, assign) CGPoint lineEnd;

@end


/*
 
 http://www.cnblogs.com/kenshincui/p/3959951.html
 */