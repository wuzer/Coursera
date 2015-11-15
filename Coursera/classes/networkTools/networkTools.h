//
//  networkTools.h
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <AFHTTPSessionManager.h>

@interface networkTools : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;

- (void)loadDataWithString:(NSString *)urlStr finished:(void (^)(NSArray *elements, NSArray *universities)) finished;
//- (void)loadNameWithID:(NSNumber *)ID finished:(void (^)(NSArray *finish)) finished;


@end
