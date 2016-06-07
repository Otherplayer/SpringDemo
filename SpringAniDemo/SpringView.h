//
//  SpringView.h
//  SpringAniDemo
//
//  Created by __无邪_ on 16/6/3.
//  Copyright © 2016年 fqah. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMainWidth [[UIScreen mainScreen] bounds].size.width
#define kMainHeight [[UIScreen mainScreen] bounds].size.height

const CGFloat WidthCenter = 58;//60
const CGFloat WidthItem = 72.5;//72.5


@interface SpringView : UIView


- (void)show:(CGFloat)dumping v:(CGFloat)velocity;

- (void)hide;

@end
