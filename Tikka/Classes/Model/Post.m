//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "Post.h"
#import "Ticker.h"

@implementation Post

#pragma mark - Initializer
#pragma mark Convenience Class Initializer

+ (instancetype)postWithUid:(NSString *)aUid created:(NSDate *)aCreated text:(NSString *)aText ticker:(Ticker *)aTicker {
    return [[self alloc] initWithUid:aUid text:aText created:aCreated ticker:aTicker];
}

#pragma mark Designated Initializer

- (instancetype)initWithUid:(NSString *)aUid text:(NSString *)aText created:(NSDate *)aCreated ticker:(Ticker *)aTicker {
    self = [super init];
    if (self) {
        NSParameterAssert(aUid != nil && aText != nil && aCreated != nil && aTicker != nil);

        self.uid = aUid;
        self.text = aText;
        self.created = aCreated;
        self.ticker = aTicker;
    }

    return self;
}

#pragma mark Superclass Designated Initializer

- (instancetype)init {
    return [self initWithUid:nil text:nil created:nil ticker:nil];
}

@end