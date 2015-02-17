//
// Created by retendo on 16.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;
@class Ticker;

@protocol APIService <NSObject>

- (RACSignal *)signupSignalForName:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword;
- (RACSignal *)loginSignalForEmail:(NSString *)aEmail password:(NSString *)aPassword;

- (RACSignal *)newPostSignalForTicker:(Ticker *)aTicker;

@end