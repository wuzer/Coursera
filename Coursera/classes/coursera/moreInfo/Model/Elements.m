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
    
//    NSLog(@"%@\n%@\n%@",ele.photo,ele.language,ele.previewLink);
//    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"coursera.plist"];
////    NSLog(@"%@",file);
//    [NSKeyedArchiver archiveRootObject:ele toFile:file];
    
//    Elements *unele = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
//    NSLog(@"%@",unele.name);
    
    return ele;
}

MJCodingImplementation



@end
