//
//  videoCell.m
//  Coursera
//
//  Created by Jefferson on 15/11/2.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "videoCell.h"
#import <Masonry.h>

@interface videoCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *schoolName;
@property (nonatomic, strong) UILabel *weekTime;
@property (nonatomic, strong) UILabel *language;
@property (nonatomic, strong) UILabel *about;

@end


@implementation videoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self baseConfig];
    }
    return self;
}

- (void)baseConfig {

    //334926258
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.schoolName];
    [self.contentView addSubview:self.weekTime];
    [self.contentView addSubview:self.language];
    [self.contentView addSubview:self.about];
    
    self.iconView.translatesAutoresizingMaskIntoConstraints = false;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.schoolName.translatesAutoresizingMaskIntoConstraints = false;
    self.weekTime.translatesAutoresizingMaskIntoConstraints = false;
    self.language.translatesAutoresizingMaskIntoConstraints = false;
    self.about.translatesAutoresizingMaskIntoConstraints = false;
    
    NSDictionary *viewDic = @{@"icon": _iconView,
                              @"cname": _nameLabel,
                              @"sname": _schoolName,
                              @"time": _weekTime,
                              @"language": _language,
                              @"about": _about
                              };
    
    
    // 水平约束
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:nil views:viewDic]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cname]-0-|" options:0 metrics:nil views:viewDic]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[time]-[language]-[sname]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[]-0-|" options:0 metrics:nil views:viewDic]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[about]-0-|" options:0 metrics:nil views:viewDic]];
    
    // 垂直约束
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon(60)]-[cname(20)]-[time(20)]-[about]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:nil views:viewDic]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - lazyLoad
- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)schoolName {
    
    if (!_schoolName) {
        _schoolName = [[UILabel alloc] init];
    }
    return _schoolName;

}

- (UILabel *)weekTime {
    
    if (!_weekTime) {
        _weekTime = [[UILabel alloc] init];
    }
    return _weekTime;
}

- (UILabel *)language {
    
    if (!_language) {
        _language = [[UILabel alloc] init];
    }
    return _language;
}

- (UILabel *)about {
    
    if (!_about) {
        _about = [[UILabel alloc] init];
    }
    return _about;

}

@end
