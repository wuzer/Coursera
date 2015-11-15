//
//  Elements.m
//  Coursera
//
//  Created by Jefferson on 15/11/14.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "Elements.h"
#import <MJExtension.h>

@implementation Elements

+ (instancetype)elementsWithDict:(NSDictionary *)dict {
    
    Elements *ele = [Elements mj_objectWithKeyValues:dict];
    return ele;
}



@end
