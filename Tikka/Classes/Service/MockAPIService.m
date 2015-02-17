//
// Created by retendo on 16.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "MockAPIService.h"
#import "RACSignal.h"
#import "Ticker.h"
#import "User.h"

@interface MockAPIService ()

@property(nonatomic, strong) User *mockUser;

@end


@implementation MockAPIService

#pragma mark - Public Methods

- (RACSignal *)signupSignalForName:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword {
    self.mockUser = [User userWithUid:@"1" name:aName email:aEmail password:aPassword];
    return [RACSignal return:[self.mockUser copy]];
}

//TODO: Better error description
- (RACSignal *)loginSignalForEmail:(NSString *)aEmail password:(NSString *)aPassword {
    BOOL isLoginAllowed = [self.mockUser.email isEqualToString:aEmail]
            && [self.mockUser.password isEqualToString:aPassword];
    return isLoginAllowed ?
            [RACSignal return:[self.mockUser copy]] :
            [RACSignal error:[[NSError alloc] init]];
}

- (RACSignal *)newPostSignalForTicker:(Ticker *)aTicker {
    return nil;
}

@end