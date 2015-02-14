//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import "Ticker.h"
#import "User.h"

@implementation Ticker

#pragma mark - Initializer
#pragma mark Convenience Class Initializer

+ (instancetype)tickerWithUid:(NSString *)aUid title:(NSString *)aTitle created:(NSDate *)aCreated author:(User *)aAuthor {
    return [[self alloc] initWithUid:aUid title:aTitle created:aCreated author:aAuthor];
}

#pragma mark Designated Initializer

- (instancetype)initWithUid:(NSString *)aUid title:(NSString *)aTitle created:(NSDate *)aCreated author:(User *)aAuthor {
    self = [super init];
    if (self) {
        NSParameterAssert(aUid != nil && aTitle != nil && aCreated != nil && aAuthor != nil);

        self.uid = aUid;
        self.author = aAuthor;
        self.created = aCreated;
        self.title = aTitle;
    }

    return self;
}

#pragma mark Superclass Designated Initializer

- (instancetype)init {
    return [self initWithUid:nil title:nil created:nil author:nil];
}

@end