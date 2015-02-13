//
// Created by retendo on 10.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListViewModel.h"
#import "RACSignal.h"
#import "RACSignal+Operations.h"
#import "RACScheduler.h"
#import "UIColor+Hue.h"
#import "NSObject+RACPropertySubscribing.h"
#import <libextobjc/EXTScope.h>
#import <ReactiveCocoa/RACSubscriptingAssignmentTrampoline.h>

@interface TickerListViewModel ()

@property(nonatomic, strong) UIColor *titleColor;
@property(nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) RACSignal *titleColorSignal;
@property (nonatomic, strong) RACSignal *bgColorSignal;

@end

static const CGFloat hueStep = (CGFloat) (1.0 / 256.0);
static const NSTimeInterval fireInterval = 0.05;


@implementation TickerListViewModel

#pragma mark Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {

        self.bgColorSignal = RACObserve(self, bgColor);
        self.titleColorSignal = RACObserve(self, titleColor);

        RACSignal *timerSignal = [RACSignal interval:fireInterval onScheduler:[RACScheduler mainThreadScheduler]];

        @weakify(self);
        RAC(self, bgColor) = [[timerSignal map:^id(id _) {
            @strongify(self);
            return [UIColor colorByIncrementingHueFromColor:self.bgColor by:hueStep];
        }] startWith:[UIColor colorWithHue:0.0 saturation:0.7 brightness:0.9 alpha:1.0]];

        RAC(self, titleColor) = [[timerSignal map:^id(id _) {
            @strongify(self);
            return [UIColor colorByIncrementingHueFromColor:self.titleColor by:hueStep];
        }] startWith:[UIColor colorWithHue:0.0 saturation:0.9 brightness:0.7 alpha:1.0]];
    }

    return self;
}

#pragma mark Public

- (NSString *)title {
    return NSLocalizedString(@"NavTitle_TickerList", @"Tikka");
}

@end