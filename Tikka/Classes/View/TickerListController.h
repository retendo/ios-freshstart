//
//  TickerListController.h
//  Tikka
//
//  Created by retendo on 10.02.15.
//  Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TickerListViewModel;

@interface TickerListController : UIViewController

// Designated initializer
- (instancetype)initWithViewModel:(TickerListViewModel *)aViewModel;

@end

