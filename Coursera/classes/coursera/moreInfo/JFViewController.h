//
//  JFViewController.h
//  Coursera
//
//  Created by Jefferson on 15/11/1.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Elements,University;

@interface JFViewController : UIViewController

@property (nonatomic, strong) NSArray *courseras;
@property (nonatomic, strong) Elements *element;
@property (nonatomic, strong) University *university;

@end
