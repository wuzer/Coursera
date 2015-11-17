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
#import "videoViewController.h"
#import <sqlite3.h>

//https://api.coursera.org/api/catalog.v1/courses?id=3&fields=smallIcon,video,estimatedClassWorkload&includes=universities

#define KURLStr @"courses?fields=previewLink,smallIcon,language,photo,aboutTheCourse,video,estimatedClassWorkload&includes=universities"

@interface JFTableViewController ()

@property (nonatomic, strong) NSArray *elements;
@property (nonatomic, strong) JFViewController *viewController;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, assign) sqlite3 *db;

@end

@implementation JFTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = false;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"coursera.plist"];
     Elements *ele = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%@%@",ele.name,ele.smallIcon);
    
//    [self addChildViewController:[[JFViewController alloc] init]];
//    [self sqliteOperation];
}

//- (void)sqliteOperation {
//    
//    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"coursera.db"];
//    
//    sqlite3 *db = NULL;
//    int status = sqlite3_open(path.UTF8String, &_db);
//    
//    if (status == SQLITE_OK) {
//        NSLog(@"打开数据库成功");
//        
//        const char *sql = "CREATE TABLE IF NOT EXISTS T_COURSERA (id integer PRIMARY KEY, name text NOT NULL);";
//        char *errmsg = NULL;
//        
//        sqlite3_exec(self.db, sql, nil, nil, &errmsg);
//        
//        
//    } else {
//        NSLog(@"打开失败!");
//    }
//}



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

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    // 开启图形上下文
//    CGSize imageSize = self.view.bounds.size;
//    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//    
//    // 渲染内容到图形上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [self.view.layer renderInContext:context];
//    
//    // 取得图片
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    [UIImagePNGRepresentation(image) writeToFile:@"/Users/Jefferson/Desktop/image.png" atomically:YES];
//    // 关闭上下文
//    UIGraphicsEndImageContext();
//}


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
    
    videoViewController *vc = [[videoViewController alloc] init];
    
    Elements *ele = self.elements[indexPath.row];
    University *uni = self.names[indexPath.row];
    
    vc.ele = ele;
    NSLog(@"%@",ele.video);
    vc.university = uni;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    // 开启图形上下文
    CGSize imageSize = self.view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    // 渲染内容到图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    
    // 取得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [UIImagePNGRepresentation(image) writeToFile:@"/Users/Jefferson/Desktop/image.png" atomically:YES];
    // 关闭上下文
    UIGraphicsEndImageContext();

    
}


@end
