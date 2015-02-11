//
// Created by retendo on 11.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListViewModel.h"
#import "UIColor+Hue.h"

@implementation UIColor (Hue)

+ (UIColor *)colorByIncrementingHueFromColor:(UIColor *)aColor by:(CGFloat)aIncAmount {
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
    CGFloat alpha;
    BOOL success = [aColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    if (success) {
        hue = (CGFloat) (hue >= 1.0 ? aIncAmount : hue + aIncAmount);
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    } else {
        return aColor;
    }
}

@end