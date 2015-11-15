//
//  JFTableViewController.m
//  Coursera
//
//  Created by Jefferson on 15/10/26.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFTableViewController.h"
#import "JFViewController.h"
#import "JFTableViewCell.h"
#import "networkTools.h"
#import "Elements.h"
#import "University.h"
#import "networkTools.h"
#import "NSObject+JFExtension.h"
#import <MJRefresh/MJRefresh.h>

//https://api.coursera.org/api/catalog.v1/courses?id=3&fields=smallIcon,video,estimatedClassWorkload&includes=universities

#define KURLStr @"courses?fields=smallIcon,video,estimatedClassWorkload&includes=universities"

@interface JFTableViewController ()

@property (nonatomic, strong) NSArray *elements;
@property (nonatomic, strong) JFViewController *viewController;
@property (nonatomic, strong) NSArray *names;

@end

@implementation JFTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = false;
//    [self addChildViewController:[[JFViewController alloc] init]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.elements = nil;
        [weakSelf loadData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        NSLog(@"-----");
    }];
    
    if (self.elements == nil) {
        
        [self.tableView.mj_header beginRefreshing];
    }
    

}


- (void)setElements:(NSArray *)elements {
    _elements = elements;
    [self.tableView reloadData];
    
}

- (void)setNames:(NSArray *)names {
    _names = names;
    [self.tableView reloadData];
}


- (void)loadData {
    
    self.elements = nil;

    __weak typeof(self) weakSelf = self;
    [[networkTools sharedNetworkTool] loadDataWithString:KURLStr finished:^(NSArray *elements, NSArray *universities) {
        weakSelf.elements = elements;
        weakSelf.names = universities;
        [weakSelf.tableView.mj_header endRefreshing];

    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.elements.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseid = @"coursera";
    JFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseid forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[JFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
    }

//     Configure the cell...
    Elements *ele = self.elements[indexPath.row];
    University *uni = self.names[indexPath.row];
    
    [cell cellForRowAtUniversi:uni Withelements:ele];

    return cell;
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JFViewController *vc = [[JFViewController alloc] init];
    
    Elements *ele = self.elements[indexPath.row];
    University *uni = self.names[indexPath.row];
    
    vc.element = ele;
    vc.university = uni;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
