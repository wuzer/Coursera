//
//  videoCell.m
//  Coursera
//
//  Created by Jefferson on 15/11/12.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "CourseraCell.h"
#import <Masonry.h>
#import "Elements.h"
#import "University.h"
#import "HTMLLabel.h"
#import <UIImageView+AFNetworking.h>

@interface CourseraCell ()

//@property (nonatomic, strong) UIImageView *iconView;
//@property (nonatomic, strong) UILabel *nameLabel;
//@property (nonatomic, strong) UILabel *schoolName;
//@property (nonatomic, strong) UILabel *weekTime;
//@property (nonatomic, strong) UILabel *language;
//@property (nonatomic, strong) UILabel *about;



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet HTMLLabel *aboutLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolName;
@end


@implementation CourseraCell

- (void)cellForElement:(Elements *)ele university:(University *)university {
    
    NSURL *url = [NSURL URLWithString:ele.photo];
    
    [self.iconView setImageWithURL:url];
    self.nameLabel.text = ele.name;
    self.timeLabel.text = ele.estimatedClassWorkload;
    self.languageLabel.text = [NSString stringWithFormat:@"language: %@",ele.language ];
    self.schoolName.text = [NSString stringWithFormat:@"university: %@",university.shortName];
    
//    [self.aboutLabel setText:ele.aboutTheCourse];
//    self.aboutLabel.text = [NSString stringWithFormat:@"aboutTheCourse:%@",ele.aboutTheCourse];
    self.aboutLabel.text = ele.aboutTheCourse;
//    NSString *htmlStr = ele.aboutTheCourse;
//    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
//    self.aboutLabel.attributedText = attStr;
    
}


//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
////        [self baseConfig];
//    }
//    return self;
//}

- (void)baseConfig {

    //334926258
//    [self.contentView addSubview:self.iconView];
//    [self.contentView addSubview:self.nameLabel];
//    [self.contentView addSubview:self.schoolName];
//    [self.contentView addSubview:self.weekTime];
//    [self.contentView addSubview:self.language];
//    [self.contentView addSubview:self.about];
    
//    self.iconView.translatesAutoresizingMaskIntoConstraints = false;
//    self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
//    self.schoolName.translatesAutoresizingMaskIntoConstraints = false;
//    self.weekTime.translatesAutoresizingMaskIntoConstraints = false;
//    self.language.translatesAutoresizingMaskIntoConstraints = false;
//    self.about.translatesAutoresizingMaskIntoConstraints = false;
//    
//    NSDictionary *viewDic = @{@"icon": _iconView,
//                              @"cname": _nameLabel,
//                              @"sname": _schoolName,
//                              @"time": _weekTime,
//                              @"language": _language,
//                              @"about": _about
//                              };
    
//    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.and.top.equalTo(self);
////        make.bottom.equalTo(self);
//    }];
//    
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.iconView.mas_bottom);
//        make.left.and.right.equalTo(self.iconView);
//        make.bottom.equalTo(self);
//    }];
    
//    
//    // 水平约束
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cname]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[time]-[language]-[sname]-0-|" options:0 metrics:nil views:viewDic]];
////    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[about]-0-|" options:0 metrics:nil views:viewDic]];
//    
//    // 垂直约束
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon(60)]-[cname(20)]-[time(20)]-[about]-0-|" options:0 metrics:nil views:viewDic]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:nil views:viewDic]];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {


    // Configure the view for the selected state
}

#pragma mark - lazyLoad
//- (UIImageView *)iconView {
//    
//    if (!_iconView) {
//        _iconView = [[UIImageView alloc] init];
//        _iconView.backgroundColor = [UIColor redColor];
//    }
//    return _iconView;
//}
//
//- (UILabel *)nameLabel {
//    
//    if (!_nameLabel) {
//        _nameLabel = [[UILabel alloc] init];
//        _nameLabel.backgroundColor = [UIColor blackColor];
//    }
//    return _nameLabel;
//}
//
//- (UILabel *)schoolName {
//    
//    if (!_schoolName) {
//        _schoolName = [[UILabel alloc] init];
//    }
//    return _schoolName;
//
//}
//
//- (UILabel *)weekTime {
//    
//    if (!_weekTime) {
//        _weekTime = [[UILabel alloc] init];
//    }
//    return _weekTime;
//}
//
//- (UILabel *)language {
//    
//    if (!_language) {
//        _language = [[UILabel alloc] init];
//    }
//    return _language;
//}
//
//- (UILabel *)about {
//    
//    if (!_about) {
//        _about = [[UILabel alloc] init];
//    }
//    return _about;
//
//}

@end
