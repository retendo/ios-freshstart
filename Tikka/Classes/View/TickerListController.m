//
//  TickerListController.m
//  Tikka
//
//  Created by retendo on 10.02.15.
//  Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "TickerListController.h"

@interface TickerListController ()

@end

@implementation TickerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];

    self.title = NSLocalizedString(@"NavTitle_TickerList", @"Tikka");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
