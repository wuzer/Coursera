//
//  homeModel.h
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class universityModel;

@interface homeModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *smallIcon;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic, copy) NSString *universityName;
@property (nonatomic, copy) NSString *estimatedClassWorkload;
@property (nonatomic, copy) NSString *video;

@property (nonatomic, strong) universityModel *universities;

+ (instancetype)homeWithDict:(NSDictionary *)dict;

@end
