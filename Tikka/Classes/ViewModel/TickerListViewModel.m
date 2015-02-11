//
// Created by retendo on 10.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListViewModel.h"

@interface TickerListViewModel ()

@property(nonatomic, strong) UIColor *bgColor;
@property(nonatomic, copy) void (^bgColorUpdateBlock)(UIColor *);
@property(nonatomic, strong) NSTimer *timer;

@end

static const CGFloat hueStep = (CGFloat) (1.0 / 256.0);

@implementation TickerListViewModel

#pragma mark Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {

        self.bgColor = [self bgColorWithHue:hueStep];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                      target:self
                                                    selector:@selector(changeColor)
                                                    userInfo:nil
                                                     repeats:YES];
    }

    return self;
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark Public

- (NSString *)title {
    return NSLocalizedString(@"NavTitle_TickerList", @"Tikka");
}

- (void)subscribeToColorChanges:(void (^)(UIColor *))aUpdateBlock {
    self.bgColorUpdateBlock = aUpdateBlock;
    aUpdateBlock(self.bgColor);
}

#pragma mark Private

- (void)setBgColor:(UIColor *)aBgColor {
    _bgColor = aBgColor;
    if (self.bgColorUpdateBlock) {
        self.bgColorUpdateBlock(_bgColor);
    }
}

- (void)changeColor {
    CGFloat hue = [self getHueForColor:self.bgColor withDefaultValue:hueStep];
    hue = (CGFloat) (hue >= 1.0 ? hueStep : hue + hueStep);
    self.bgColor = [self bgColorWithHue:hue];
}

- (UIColor *)bgColorWithHue:(CGFloat)aHue {
    return [UIColor colorWithHue:aHue saturation:0.9 brightness:0.9 alpha:1.0];
}

- (CGFloat)getHueForColor:(UIColor *)aColor withDefaultValue:(CGFloat)aDefaultValue {
    CGFloat hue;
    BOOL success = [aColor getHue:&hue saturation:nil brightness:nil alpha:nil];
    return success ? hue : aDefaultValue;
}

@end