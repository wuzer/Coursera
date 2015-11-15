//
//  networkTools.m
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "networkTools.h"
#import "Elements.h"
#import "University.h"

#define baseUrlStr @"https://api.coursera.org/api/catalog.v1/"


@implementation networkTools



+ (instancetype)sharedNetworkTool {
    
    static networkTools *instance = nil;
    static dispatch_once_t oncetToken;
    
    NSURL *baseUrl = [NSURL URLWithString:baseUrlStr];
    
    dispatch_once(&oncetToken, ^{
        instance = [[self alloc] initWithBaseURL:baseUrl];
    });
    return instance;
}

- (void)loadDataWithString:(NSString *)urlStr finished:(void (^)(NSArray *, NSArray *))finished {
    
    
    
    
    [self GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSLog(@"%@",responseObject);
        NSArray *elements = responseObject[@"elements"];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (NSDictionary *dic in elements) {
//            NSLog(@"%@",responseObject);
//            homeModel *home = [homeModel homeWithDict:dic];
            [tempArray addObject:[Elements elementsWithDict:dic]];
        }
        
        NSDictionary *linked = responseObject[@"linked"];
        NSArray *universities = linked[@"universities"];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:universities.count];
        
        for (NSDictionary *dic in universities) {
            [arrayM addObject:[University universityWithDict:dic]];
        }
        
        finished(tempArray.copy,arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

//- (void)loadNameWithID:(NSNumber *)ID finished:(void (^)(NSArray *))finished {
////    NSLog(@"%@",ID);
//    NSAssert(ID != nil, @"cannot be nil");
//    
//    NSString *urlStr = [NSString stringWithFormat:@"universities?id=%@",ID];
////    NSLog(@"%@",urlStr);
//    
//    [self GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        NSArray *elements = responseObject[@"elements"];
//        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:elements.count];
//        
//        for (NSDictionary *dic in elements) {
//            [tempArray addObject:[universityModel nameWithDict:dic]];
//        }
//        finished(tempArray.copy);
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
//
//}


@end
