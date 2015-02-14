//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "User.h"
#import "SSKeychain.h"

static NSString *const bundleId = [[NSBundle mainBundle] bundleIdentifier];

@implementation User

#pragma mark - Initializer
#pragma mark Convenience Class Initializer

+ (instancetype)userWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword {
    return [[self alloc] initWithUid:aUid name:aName email:aEmail password:aPassword];
}

+ (instancetype)userWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail {
    return [[self alloc] initWithUid:aUid name:aName email:aEmail];
}

#pragma mark Designated Initializer

- (instancetype)initWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword {
    self = [super init];
    if (self) {
        NSParameterAssert(aUid != nil && aName != nil && aEmail != nil);

        self.uid = aUid;
        self.name = aName;
        self.email = aEmail;
        if (aPassword) self.password = aPassword;
    }

    return self;
}

#pragma mark Secondary Initializer

- (instancetype)initWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail {
    return [self initWithUid:aUid name:aName email:aEmail password:nil];
}

#pragma mark Superclass Designated Initializer

- (instancetype)init {
    return [self initWithUid:nil name:nil email:nil password:nil];
}

#pragma mark - Getter/Setter

//TODO: Error handling
- (NSString *)password {
    return [SSKeychain passwordForService:bundleId
                                  account:self.email];
}

- (void)setPassword:(NSString *)password {
    [SSKeychain setPassword:password
                 forService:bundleId
                    account:self.email];
}

@end