//
//  HNCustomHUD.m
//  witcontact
//
//  Created by songtao on 16/11/18.
//
//

#import "HNCustomHUD.h"
#import "UIImage+GIF.h"

@interface HNCustomHUD ()

@property (nonatomic) UIImageView *imgView;
@property (nonatomic) HNLabel *tipLb;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic,copy) void(^dimViewClick)(void);

@end

@implementation HNCustomHUD

#pragma mark - 懒加载

- (UIImageView *)imgView{
    if (_imgView==nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.center = self.center;
        _imgView.image = [UIImage sd_animatedGIFNamed:@"witing2"];
        [self addSubview:_imgView];
    }
    return _imgView;
}

- (HNLabel *)tipLb{
    if (_tipLb==nil) {
        _tipLb = [[HNLabel alloc] init];
        _tipLb.textColor = [UIColor whiteColor];
        _tipLb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLb];
    }
    return _tipLb;
}

- (UIProgressView *)progressView
{
    if (!_progressView)
    {
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        // 设置进度条的色彩
        [_progressView setTrackTintColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
        _progressView.progressTintColor = [UIColor greenColor];
        [self addSubview:_progressView];
    }
    return _progressView;
}

#pragma mark - 初始化

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:)name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    }
    return self;
}

+ (void)showHUDWithTipStr:(NSString *)tipStr{
    HNCustomHUD *hud = [[self alloc] init];
    hud.tipLb.text = tipStr;
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    [hud setNeedsLayout];
}

+ (void)dimViewClickWith:(void (^)(void))dimViewClick{
    UIView *superView =  [UIApplication sharedApplication].delegate.window;
    HNCustomHUD *hud = [self HUDForView:superView];
    if (hud!=nil) {
        hud.dimViewClick = dimViewClick;
    }
}

+ (void)showHUDWithProgress{
    HNCustomHUD *hud = [[self alloc] init];
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    [hud setNeedsLayout];
}

+ (void)setProgress:(CGFloat)progress{
    UIView *superView =  [UIApplication sharedApplication].delegate.window;
    HNCustomHUD *hud = [self HUDForView:superView];
    if (hud!=nil){
        hud.progressView.progress = progress;
    }
}

+ (HNCustomHUD *)HUDForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (HNCustomHUD *)subview;
        }
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (self.dimViewClick) {
        self.dimViewClick();
    }
}

+ (void)hiddenHUD{
    UIView *superView =  [UIApplication sharedApplication].delegate.window;
    HNCustomHUD *hud = [self HUDForView:superView];
    if (hud!=nil){
        [hud.imgView removeFromSuperview];
        [hud.progressView removeFromSuperview];
        [hud.tipLb removeFromSuperview];
        [hud removeFromSuperview];
        hud.imgView = nil;
        hud.progressView = nil;
        hud.tipLb = nil;
        hud.dimViewClick = nil;
        hud = nil;
    }
}

- (void)layoutSubviews{
    self.frame = self.superview.bounds;
    self.imgView.frame = CGRectMake(0, 0, M*6, M*6);
    self.imgView.center = self.center;
    if (self.tipLb.text.length>0) {
        self.tipLb.frame = [HNViewFrameSetupTool FXY:_imgView xt:1 yt:8 W1:A21 H1:H a:0 b:M];
        self.tipLb.font = [UIFont systemFontOfSize:kfontSize];
        self.tipLb.hidden = NO;
        self.progressView.frame = [HNViewFrameSetupTool FXY:_imgView xt:1 yt:8 W1:A21 H1:0 a:0 b:M];
        self.progressView.hidden = YES;
    }else{
        self.tipLb.frame = [HNViewFrameSetupTool FXY:_imgView xt:1 yt:8 W1:A21 H1:0 a:0 b:M];
        self.tipLb.hidden = YES;
        self.progressView.frame = [HNViewFrameSetupTool FXY:_imgView xt:1 yt:8 W1:A21 H1:M a:0 b:M];
        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 3.0f);
        self.progressView.transform = transform;
        self.progressView.layer.cornerRadius = 3.0;
        self.progressView.layer.masksToBounds = YES;
        self.progressView.hidden = NO;
    }
}

- (void)orientationDidChange:(NSNotification *)note{
    [self setNeedsLayout];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
