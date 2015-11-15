//
//  JFTableViewCell.m
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "homeModel.h"
#import "universityModel.h"

@interface JFTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *schoolName;

@property (weak, nonatomic) IBOutlet UILabel *workLoadCount;

@end

@implementation JFTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


//- (void)setData:(homeModel *)home {
//    _home = home;
//    
//    
//    [self.iconView setImageWithURL:[NSURL URLWithString:home.smallIcon]];
//    
//    self.nameLabel.text = home.name;
//    self.workLoadCount.text = home.estimatedClassWorkload;
//    self.schoolName.text = home.universities.shortName;
//
//}

- (void)setHome:(homeModel *)home {
    _home = home;
    
    [self.iconView setImageWithURL:[NSURL URLWithString:home.smallIcon]];
    
    self.nameLabel.text = home.name;
    self.workLoadCount.text = home.estimatedClassWorkload;
    NSLog(@"%@",home.video);

}

- (void)setUniversity:(universityModel *)university {
    
    _university = university;
    
    self.schoolName.text = [NSString stringWithFormat:@"Universty: %@",university.shortName];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
