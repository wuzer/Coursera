//
//  videoViewController.h
//  Coursera
//
//  Created by Jefferson on 15/11/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class University,Elements;

@interface videoViewController : UITableViewController

@property (nonatomic, strong) Elements *ele;
@property (nonatomic, strong) University *university;

@end
