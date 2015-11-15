//
//  universityModel.h
//  Coursera
//
//  Created by Jefferson on 15/10/30.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface universityModel : NSObject

@property (nonatomic, copy) NSString *shortName;

+ (instancetype)nameWithDict:(NSDictionary *)dict;

@end
