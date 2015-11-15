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
#import "homeModel.h"
#import "universityModel.h"
#import "networkTools.h"
#import "NSObject+JFExtension.h"
#import <MJRefresh/MJRefresh.h>

//https://api.coursera.org/api/catalog.v1/courses?id=3&fields=smallIcon,video,estimatedClassWorkload&includes=universities

#define URLStr @"courses?id=3&fields=smallIcon,video,estimatedClassWorkload&includes=universities"

@interface JFTableViewController ()

@property (nonatomic, strong) NSArray *elements;
@property (nonatomic, strong) JFViewController *viewController;
@property (nonatomic, strong) NSArray *names;

@end

@implementation JFTableViewController

- (void)viewDidLoad {
    
    NSLog(@"%@",self);
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = false;
//    [self addChildViewController:[[JFViewController alloc] init]];
    
    
    __weak typeof(self) weakSelf = self;
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        self.elements = nil;
        [weakSelf loadData];
        
    }];
    
    [self.tableView.header beginRefreshing];
    
}

- (void)setElements:(NSArray *)elements {
    _elements = elements;
    [self.tableView reloadData];
    [self.tableView.header endRefreshing];
}

- (void)loadData {
    
    [[networkTools sharedNetworkTool] GET:URLStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        // 获取课程数组
        NSArray *elements = responseObject[@"elements"];
        
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        NSNumber *nameID = nil;
        
        for (NSDictionary *dict in elements) {
            
            NSDictionary *links = dict[@"links"];
            NSArray *university = links[@"universities"];
            
            // 学校 id
            nameID = university.lastObject;
            //            NSLog(@"%@",nameID);
            
            NSDictionary *linked = responseObject[@"linked"];
            NSArray *universities = linked[@"universities"];
            
            NSMutableArray *arrayM = [NSMutableArray array];
            for (NSDictionary *dict in universities) {
                
                NSNumber *uniID = dict[@"id"];
                
                if (uniID == nameID) {
                    [arrayM addObject:[universityModel nameWithDict:dict]];
                }
                
            }
            // 学校名字数组
            self.names = arrayM.copy;
            NSLog(@"%@",self.names);
            
            
            [tempArray addObject:[homeModel homeWithDict:dict]];
            
        }
        self.elements = tempArray.copy;
//        [self.tableView reloadData];
        NSLog(@"%@",self.elements);
                
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.elements.count;
//    return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseid = @"coursera";
    JFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseid forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[JFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
    }
    
    
    // Configure the cell...
    cell.home = self.elements[indexPath.row];
    cell.university = self.names[indexPath.row];
    
    
    return cell;
}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"---%s---",__func__);
    
    
    
    [self.navigationController pushViewController:self.viewController animated:YES];
    
}

- (JFViewController *)viewController {

    if (!_viewController) {
        _viewController = [[JFViewController alloc] init];
    }
    return _viewController;
}




@end
