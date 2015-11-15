//
//  homeModel.m
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "homeModel.h"
#import "networkTools.h"
#import "NSObject+JFExtension.h"
#import "NSArray+Log.h"
//#import "universityModel.h"

@implementation homeModel

+ (instancetype)homeWithDict:(NSDictionary *)dict {
    
    return [self objectWithDict:dict];
}

@end
