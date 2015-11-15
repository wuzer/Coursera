//
//  JFTableViewCell.h
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class homeModel;
@class universityModel;

@interface JFTableViewCell : UITableViewCell

@property (nonatomic, strong) homeModel *home;
@property (nonatomic, strong) universityModel *university;

@end
