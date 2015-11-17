//
//  JFTableViewCell.h
//  Coursera
//
//  Created by Jefferson on 15/11/11.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Elements;
@class University;

@interface JFTableViewCell : UITableViewCell

@property (nonatomic, strong) University *university;
@property (nonatomic, strong) Elements *elements;

- (void)cellForRowAtUniversi:(University *)universi Withelements:(Elements *)element;

@end
