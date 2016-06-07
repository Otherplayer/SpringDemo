//
//  SpringView.m
//  SpringAniDemo
//
//  Created by __无邪_ on 16/6/3.
//  Copyright © 2016年 fqah. All rights reserved.
//

#import "SpringView.h"
#define SD_DEGREES_TO_RADIANS(degrees) ((degrees) * M_PI / 180.0)
@interface SpringView ()

@property (nonatomic, strong) UIImageView *ivImageView;

@property (nonatomic, strong) UIButton *btnReleaseDynamic;
@property (nonatomic, strong) UIButton *btnReleaseNotice;

@property (nonatomic, strong) UIButton *btnReleaseDynamicTitle;
@property (nonatomic, strong) UIButton *btnReleaseNoticeTitle;



@end


@implementation SpringView{
    CGFloat GMarginWidth;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, kMainWidth, kMainHeight)];
        [self setBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.500]];
        [self setAlpha:0];
        
        GMarginWidth = (kMainWidth - WidthItem * 2) / (2 + 1.5);//边距
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self setUserInteractionEnabled:YES];
        [self addGestureRecognizer:tapGesture];
        
        [self addSubview:self.btnReleaseDynamic];
        [self addSubview:self.btnReleaseNotice];
        [self addSubview:self.btnReleaseDynamicTitle];
        [self addSubview:self.btnReleaseNoticeTitle];
    }
    return self;
}
//推荐  0.6900//1.66952
//推荐  0.58//12.54

- (void)show:(CGFloat)dumping v:(CGFloat)velocity{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:self];
    [window addSubview:self.ivImageView];
    //UIViewAnimationOptionCurveEaseOut：动画逐渐加速。
    //UIViewAnimationOptionCurveEaseInOut：动画先缓慢，然后逐渐加速。
    
    CGFloat height = kMainHeight - WidthItem * 3;
    
    CABasicAnimation* rotationAnimation = [self basicAnimation:SD_DEGREES_TO_RADIANS(135)];
    CASpringAnimation* rotationAnimation2 = [self clockwiseAnimation: SD_DEGREES_TO_RADIANS(-90)];
    [self.ivImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
    
    [UIView animateWithDuration:0.55 animations:^{
        self.alpha = 1;
    }];
    
    [UIView animateWithDuration:0.55 delay:0 usingSpringWithDamping:dumping initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.btnReleaseDynamic setFrame:CGRectMake(GMarginWidth, height, WidthItem, WidthItem)];
        [self.btnReleaseDynamic.layer addAnimation:rotationAnimation2 forKey:@"rotationDynamic"];
    } completion:nil];

    [UIView animateWithDuration:0.20 delay:0.25 usingSpringWithDamping:0.25 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.btnReleaseDynamicTitle setAlpha:1];
        [self.btnReleaseDynamicTitle setFrame:CGRectMake(GMarginWidth, kMainHeight - WidthItem * 2, WidthItem, WidthItem/2.0)];
    } completion:nil];
    [UIView animateWithDuration:0.55 delay:0.12 usingSpringWithDamping:dumping initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.btnReleaseNotice setFrame:CGRectMake(kMainWidth - WidthItem - GMarginWidth, height, WidthItem, WidthItem)];
        [self.btnReleaseNotice.layer addAnimation:rotationAnimation2 forKey:@"rotationNotice"];
    } completion:nil];
    
    [UIView animateWithDuration:0.32 delay:0.36 usingSpringWithDamping:0.25 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.btnReleaseNoticeTitle setAlpha:1];
        [self.btnReleaseNoticeTitle setFrame:CGRectMake(kMainWidth - WidthItem - GMarginWidth, kMainHeight - WidthItem * 2, WidthItem, WidthItem/2.0)];
    } completion:nil];
    
    
    
}
- (void)hide{
    //UIViewAnimationOptionCurveEaseIn  动画逐渐变慢。
    
    
    CABasicAnimation* rotationAnimation = [self basicAnimation:SD_DEGREES_TO_RADIANS(-90)];
    [self.ivImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
    
    [UIView animateWithDuration:0.1 animations:^{
        [self.btnReleaseNoticeTitle setAlpha:0];
//        [self.btnReleaseNoticeTitle setFrame:CGRectMake(kMainWidth - WidthItem * 1.4, kMainHeight - WidthItem * 2, WidthItem, WidthItem/2.0)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.btnReleaseNotice setFrame:CGRectMake((kMainWidth - WidthCenter) / 2.0, kMainHeight - WidthCenter, WidthCenter, WidthCenter)];
            self.btnReleaseNotice.alpha = 0.5;
        } completion:^(BOOL finished) {
            self.btnReleaseNotice.alpha = 0;
        }];
    }];
    
    
    [UIView animateWithDuration:0.15 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.btnReleaseDynamicTitle setAlpha:0];
//        [self.btnReleaseDynamicTitle setFrame:CGRectMake(WidthItem * 0.4, kMainHeight - WidthItem * 2, WidthItem, WidthItem/2.0)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.btnReleaseDynamic setFrame:CGRectMake((kMainWidth - WidthCenter) / 2.0, kMainHeight - WidthCenter, WidthCenter, WidthCenter)];
            self.btnReleaseDynamic.alpha = 0.5;
        } completion:^(BOOL finished) {
            self.btnReleaseDynamic.alpha = 0;
        }];
    }];
    
    [UIView animateWithDuration:0.65 animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    

    
}


#pragma mark - Animation
//基本旋转
- (CABasicAnimation *)basicAnimation:(CGFloat)angle{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: angle];
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.additive = YES;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.repeatCount = 1;
    return rotationAnimation;
}
//仿真旋转
- (CASpringAnimation *)clockwiseAnimation:(CGFloat)angle{
    CASpringAnimation* rotationAnimation;
    rotationAnimation = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: angle];//M_PI / 4.0 * 3
    //rotationAnimation.mass = 0.5;//质量
    //rotationAnimation.stiffness = 0;//刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    rotationAnimation.cumulative = YES;
    rotationAnimation.additive = YES;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    //rotationAnimation.repeatCount = 1;
    rotationAnimation.damping = 3;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    rotationAnimation.initialVelocity=0;//初始速率，动画视图的初始速度大小
    rotationAnimation.duration = rotationAnimation.settlingDuration;
    NSLog(@"=======%f",rotationAnimation.settlingDuration);
    return rotationAnimation;
}




#pragma mark - New Configure

- (UIImageView *)ivImageView{
    if (!_ivImageView) {
        _ivImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kMainWidth - WidthCenter) / 2.0, kMainHeight - WidthCenter, WidthCenter, WidthCenter)];
        _ivImageView.contentMode = UIViewContentModeScaleAspectFill;
        _ivImageView.image = [UIImage imageNamed:@"ios_c_circle"];
    }
    return _ivImageView;
}

- (UIButton *)btnReleaseDynamic{
    if (!_btnReleaseDynamic) {
        _btnReleaseDynamic = [[UIButton alloc] initWithFrame:CGRectMake((kMainWidth - WidthItem) / 2.0, kMainHeight - WidthItem, WidthItem, WidthItem)];
        [_btnReleaseDynamic.layer setCornerRadius:WidthItem/2.0];
        [_btnReleaseDynamic.layer setMasksToBounds:YES];
        [_btnReleaseDynamic setBackgroundImage:[UIImage imageNamed:@"ios_c_dynamic"] forState:UIControlStateNormal];
    }
    return _btnReleaseDynamic;
}

- (UIButton *)btnReleaseNotice{
    if (!_btnReleaseNotice) {
        _btnReleaseNotice = [[UIButton alloc] initWithFrame:CGRectMake((kMainWidth - WidthItem) / 2.0, kMainHeight - WidthItem, WidthItem, WidthItem)];
        [_btnReleaseNotice.layer setCornerRadius:WidthItem/2.0];
        [_btnReleaseNotice.layer setMasksToBounds:YES];
        
        [_btnReleaseNotice setBackgroundImage:[UIImage imageNamed:@"ios_c_notice"] forState:UIControlStateNormal];
    }
    return _btnReleaseNotice;
}

- (UIButton *)btnReleaseDynamicTitle{
    if (!_btnReleaseDynamicTitle) {
        CGFloat height = kMainHeight - WidthItem * 2;
        _btnReleaseDynamicTitle = [[UIButton alloc] initWithFrame:CGRectMake(WidthItem * 0.4, height, WidthItem, WidthItem/2.0)];
        [_btnReleaseDynamicTitle setTitle:@"发动态" forState:UIControlStateNormal];
        [_btnReleaseDynamicTitle.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_btnReleaseDynamicTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnReleaseDynamicTitle setClipsToBounds:YES];
        [_btnReleaseDynamicTitle setAlpha:0];
    }
    return _btnReleaseDynamicTitle;
}
- (UIButton *)btnReleaseNoticeTitle{
    if (!_btnReleaseNoticeTitle) {
        CGFloat height = kMainHeight - WidthItem * 2;
        _btnReleaseNoticeTitle = [[UIButton alloc] initWithFrame:CGRectMake(kMainWidth - WidthItem * 1.4, height, WidthItem, WidthItem/2.0)];
        [_btnReleaseNoticeTitle setTitle:@"发通告" forState:UIControlStateNormal];
        [_btnReleaseNoticeTitle.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_btnReleaseNoticeTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnReleaseNoticeTitle setClipsToBounds:YES];
        [_btnReleaseNoticeTitle setAlpha:0];
    }
    return _btnReleaseNoticeTitle;
}



@end
