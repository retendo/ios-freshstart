//
//  TickerListController.m
//  Tikka
//
//  Created by retendo on 10.02.15.
//  Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListController.h"
#import "TickerListViewModel.h"
#import "RACSubscriptingAssignmentTrampoline.h"

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

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = titleLabel;

    // Get static value from view model
    titleLabel.text = self.viewModel.title;

    // Subscribe to value changes with ReactiveCocoa
    RAC(self.view, backgroundColor) = self.viewModel.bgColorSignal;
    RAC(titleLabel, textColor) = self.viewModel.titleColorSignal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
