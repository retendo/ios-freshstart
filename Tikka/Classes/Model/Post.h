//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ticker;

@interface Post : NSObject

@property(nonatomic, copy) NSString *uid;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, strong) NSDate *created;
@property(nonatomic, strong) Ticker *ticker;

- (instancetype)initWithUid:(NSString *)aUid text:(NSString *)aText created:(NSDate *)aCreated ticker:(Ticker *)aTicker;

+ (instancetype)postWithUid:(NSString *)aUid created:(NSDate *)aCreated text:(NSString *)aText ticker:(Ticker *)aTicker;


@end