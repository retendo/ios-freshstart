//
// Created by retendo on 11.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <UIKit/UIkit.h>

@interface UIColor (Hue)

+ (UIColor *)colorByIncrementingHueFromColor:(UIColor *)aColor by:(CGFloat)aIncAmount;

@end