//
//  HNCustomHUD.h
//  witcontact
//
//  Created by songtao on 16/11/18.
//
//

#import <UIKit/UIKit.h>

@interface HNCustomHUD : UIView

+ (void)showHUDWithTipStr:(NSString *)tipStr;
+ (void)showHUDWithProgress;
+ (void)setProgress:(CGFloat)progress;
+ (void)hiddenHUD;
+ (void)dimViewClickWith:(void(^)(void))dimViewClick;

@end
