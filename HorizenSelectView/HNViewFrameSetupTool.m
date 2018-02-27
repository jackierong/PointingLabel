//
//  HNViewFrameSetupTool.m
//  HNwitLink

#import "HNViewFrameSetupTool.h"

@implementation HNViewFrameSetupTool
//+(CGRect)getViewOriginWithRelatedView:(UIView*)relatedView horizontalType:(int)horizontalType verticalType:(int)verticalType offSetPoint:(CGPoint)offSetPoint viewSize:(CGSize)viewSize{
//    float superViewW = relatedView.bounds.size.width;
//    float superViewH = relatedView.bounds.size.height;
//    float superViewX = relatedView.frame.origin.x;
//    float superViewY = relatedView.frame.origin.y;
//
//    float viewW = viewSize.width;
//    float viewH = viewSize.height;
//
//    float viewX = (int)superViewX + (int)(0.5 * ((horizontalType % 6) * superViewW - (horizontalType % 4) * viewW)) + (int)offSetPoint.x;
//    float viewY = (int)superViewY + (int)(0.5 * ((verticalType % 6) * superViewH - (verticalType % 4) * viewH)) + (int)offSetPoint.y;
//    return CGRectMake(viewX, viewY, viewW, viewH);
//}

+ (CGRect)FXY:(UIView*)objt xt:(int)xt yt:(int)yt W1:(int)W1 H1:(int)H1 a:(int)a b:(int)b{
    float W0 = objt.frame.size.width;
    float H0 = objt.frame.size.height;
    float X0 = objt.frame.origin.x;
    float Y0 = objt.frame.origin.y;
    int X1 = (int)X0 + (int)(0.5 * ((xt % 6) * W0 - (xt % 4) * W1)) + (int)a;
    int Y1 = (int)Y0 + (int)(0.5 * ((yt % 6) * H0 - (yt % 4) * H1)) + (int)b;
    return CGRectMake(X1, Y1, W1, H1);
}

@end

