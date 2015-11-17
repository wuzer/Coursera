//
//  JFTableViewCell.m
//  Coursera
//
//  Created by Jefferson on 15/11/11.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "Elements.h"
#import "University.h"

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

- (void)cellForRowAtUniversi:(University *)universi Withelements:(Elements *)element {
    
    [self.iconView setImageWithURL:[NSURL URLWithString:element.smallIcon]];
    self.nameLabel.text = element.name;
    self.workLoadCount.text = element.estimatedClassWorkload;
    
    self.schoolName.text = [NSString stringWithFormat:@"Universty: %@",universi.shortName];

}



//- (void)setHome:(homeModel *)home {
//    _home = home;
//    
//    [self.iconView setImageWithURL:[NSURL URLWithString:home.smallIcon]];
//    
//    self.nameLabel.text = home.name;
//    self.workLoadCount.text = home.estimatedClassWorkload;
//
//
//}
//
//- (void)setUniversity:(universityModel *)university {
//    
//    _university = university;
//    
//    self.schoolName.text = [NSString stringWithFormat:@"Universty: %@",university.shortName];
//
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
