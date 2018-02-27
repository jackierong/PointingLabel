//
//  HNViewFrameSetupTool.h
//  HNwitLink


#import <Foundation/Foundation.h>
//水平排列 类型
typedef NS_ENUM(NSInteger, HorizontalType) {
    // 0——靠左对齐
    HorizontalTypeAlignmentLeft = 0,
    // 1——水平居中
    HorizontalTypeAlignmentCenter =1,
    //2——靠右对齐
    HorizontalTypeAlignmentRight = 2,
    // 6——浮动于左
    HorizontalTypeAlignmentFloatLeft = 6,
    // 8——浮动于右
    HorizontalTypeAlignmentFloatRight = 8
};

//纵向排列 类型
typedef NS_ENUM(NSInteger, VerticalType) {
    // 0——靠上对齐；
    VerticalTypeAlignmentTop = 0,
    // 1——垂直居中；
    VerticalTypeAlignmentCenter = 1,
    //2——靠下对齐；
    VerticalTypeAlignmentBottom = 2,
    // 6——浮动于上；
    VerticalTypeAlignmentFloatTop = 6,
    // 8——浮动于下
    VerticalTypeAlignmentFloatBottom= 8
};

@interface HNViewFrameSetupTool : NSObject


//+(CGRect)getViewOriginWithRelatedView:(UIView*)relatedView horizontalType:(int)horizontalType verticalType:(int)verticalType offSetPoint:(CGPoint)offSetPoint viewSize:(CGSize)viewSize;


+ (CGRect)FXY:(UIView*)objt xt:(int)xt yt:(int)yt W1:(int)W1 H1:(int)H1 a:(int)a b:(int)b;

@end
