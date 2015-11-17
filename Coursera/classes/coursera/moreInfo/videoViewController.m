//
//  videoViewController.m
//  Coursera
//
//  Created by Jefferson on 15/11/2.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "videoViewController.h"
#import "University.h"
#import "Elements.h"
#import "CourseraCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import <XCDYouTubeVideoPlayerViewController.h>

@interface videoViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *gestureRecognizer;
@property (nonatomic, strong) NSString *code;

@end

@implementation videoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
//    [self.tableView registerClass:[videoCell class] forCellReuseIdentifier:reuseID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CourseraCell class]) bundle:nil] forCellReuseIdentifier:reuseID];
    self.gestureRecognizer.delegate = self;
//    self.tableView.rowHeight = 200;
    self.tableView.estimatedRowHeight = 100;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView setNeedsLayout];
    self.tableView.showsVerticalScrollIndicator = false;
    self.tableView.tableFooterView = [[UIView alloc] init];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.code = self.ele.video;
    NSLog(@"%@",self.code);
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

static NSString *reuseID = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CourseraCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
//     Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat:@"---%zd",indexPath.row];
//    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9]
    
    [cell cellForElement:self.ele university:self.university];
//    cell.iconView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
//    [gestureRecognizer setNumberOfTapsRequired:1];
//    gestureRecognizer.cancelsTouchesInView = YES;
//    gestureRecognizer.delaysTouchesBegan = YES;
    
//    [tap setNumberOfTouchesRequired:1];
//    cell.userInteractionEnabled = false;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    [cell.iconView addGestureRecognizer:gestureRecognizer];
    
    return cell;
}

//- (void)tapView:(UITapGestureRecognizer *)sender {
//    
//    NSLog(@"%@",sender);
//    
//}

#pragma mark - gestureDelegate

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
//        return NO;
//    }
//    return YES;
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

#pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"---%@",self.code);
    XCDYouTubeVideoPlayerViewController *videoPlayerVC = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:self.code];
    [self presentViewController:videoPlayerVC animated:YES completion:nil];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return [tableView fd_heightForCellWithIdentifier:reuseID configuration:^(id cell) {
//        NSLog(@"%@",cell);
//    }];
//
//}

//- (void)setCode:(NSString *)code {
//    _code = code;
//    code = self.ele.video;
//    NSLog(@"%@",code);
//}

@end
