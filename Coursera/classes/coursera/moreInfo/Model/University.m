//
//  University.m
//  Coursera
//
//  Created by Jefferson on 15/11/14.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "University.h"
#import <MJExtension.h>

@implementation University

+ (instancetype)universityWithDict:(NSDictionary *)dict {
    
    University *uni = [University mj_objectWithKeyValues:dict];
    return uni;
};

@end
