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
#import "videoCell.h"

@interface videoViewController ()

@end

@implementation videoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerClass:[videoCell class] forCellReuseIdentifier:reuseID];
    
    NSLog(@"%@--%@",self.university.shortName,self.ele.name);
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

static NSString *reuseID = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    videoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    

//       videoCell cell = [[videoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    
    
//     Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat:@"---%zd",indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:0.9];
    
    
    
    
    return cell;
}


@end
