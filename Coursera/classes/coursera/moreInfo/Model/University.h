//
//  University.h
//  Coursera
//
//  Created by Jefferson on 15/11/14.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface University : NSObject

@property (nonatomic, copy) NSString *shortName;

+ (instancetype)universityWithDict:(NSDictionary *)dict;

@end
