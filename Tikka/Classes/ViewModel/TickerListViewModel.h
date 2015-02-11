//
// Created by retendo on 10.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RACSignal;

@interface TickerListViewModel : NSObject

@property (nonatomic, strong, readonly) RACSignal *bgColorSignal;

- (NSString *)title;

- (void)subscribeToTitleColorChanges:(void (^)(UIColor *))aUpdateBlock;

@end