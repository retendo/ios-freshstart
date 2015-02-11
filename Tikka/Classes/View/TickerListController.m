//
//  TickerListController.m
//  Tikka
//
//  Created by retendo on 10.02.15.
//  Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListController.h"
#import "TickerListViewModel.h"

@interface TickerListController ()

@property(nonatomic, strong) TickerListViewModel *viewModel;

@end


@implementation TickerListController

#pragma mark Initializer
#pragma mark Designated Initializer

- (instancetype)initWithViewModel:(TickerListViewModel *)aViewModel {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        NSParameterAssert(aViewModel != nil);

        self.viewModel = aViewModel;
    }

    return self;
}

#pragma mark Superclass Designated Initializer

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithViewModel:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Get static value from view model
    self.title = self.viewModel.title;

    // Subscribe to value changes without ReactiveCocoa
    __weak TickerListController *weakSelf = self;
    [self.viewModel subscribeToColorChanges:^(UIColor *aColor) {
        weakSelf.view.backgroundColor = aColor;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
