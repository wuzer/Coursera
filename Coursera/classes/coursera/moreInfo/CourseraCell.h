//
//  videoCell.h
//  Coursera
//
//  Created by Jefferson on 15/11/2.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Elements,University;

@interface CourseraCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
- (void)cellForElement:(Elements *)ele university:(University *)university;

@end
