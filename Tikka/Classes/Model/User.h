//
// Created by retendo on 14.02.15.
// Copyright (c) 2015 Oliver Rösner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, copy) NSString *uid;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *email;
@property(nonatomic) NSString *password;

+ (instancetype)userWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword;

- (instancetype)initWithUid:(NSString *)aUid name:(NSString *)aName email:(NSString *)aEmail password:(NSString *)aPassword;
- (instancetype)initWithUid:(NSString *)uid name:(NSString *)name email:(NSString *)email;

@end