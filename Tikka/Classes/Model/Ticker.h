//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Ticker : NSObject

@property(nonatomic, copy) NSString *uid;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) NSDate *created;
@property(nonatomic, strong) User *author;

+ (instancetype)tickerWithUid:(NSString *)aUid title:(NSString *)aTitle created:(NSDate *)aCreated author:(User *)aAuthor;

- (instancetype)initWithUid:(NSString *)aUid title:(NSString *)aTitle created:(NSDate *)aCreated author:(User *)aAuthor;

@end