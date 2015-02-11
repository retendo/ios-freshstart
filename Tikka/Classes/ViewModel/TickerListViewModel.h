//
// Created by retendo on 10.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TickerListViewModel : NSObject

- (NSString *)title;

- (void)subscribeToColorChanges:(void (^)(UIColor *))aUpdateBlock;

@end