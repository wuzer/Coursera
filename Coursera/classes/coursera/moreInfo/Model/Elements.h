//
//  Elements.h
//  Coursera
//
//  Created by Jefferson on 15/11/14.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Elements : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *smallIcon;
@property (nonatomic, copy) NSString *estimatedClassWorkload;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *aboutTheCourse;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *previewLink;
@property (nonatomic, copy) NSString *filePath;

+ (instancetype)elementsWithDict:(NSDictionary *)dict;

@end
