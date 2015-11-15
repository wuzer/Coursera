//
//  JFViewController.m
//  Coursera
//
//  Created by Jefferson on 15/11/1.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "JFViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <YTPlayerView.h>
#import "videoViewController.h"
#import "Elements.h"


#define Kwidth [UIScreen mainScreen].bounds.size.width
#define Kheight [UIScreen mainScreen].bounds.size.height
#define KurlStr https://www.youtube.com/watch?v=bVMBe50GfnI



@interface JFViewController ()

@property (nonatomic, strong) YTPlayerView *playerView;
@property (nonatomic, strong) AVPlayer *player;


@end

@implementation JFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self baseConfig];
    
}

- (void)baseConfig {
    
    self.playerView.frame = CGRectMake(0, 0, Kwidth, 200);
    self.playerView.backgroundColor = [UIColor yellowColor];
//    NSLog(@"%s",__func__);
    
    [self.view addSubview:self.playerView];
    
    [self.playerView loadWithVideoId:@"bVMBe50GfnI"];
    
    
    // 添加 tableView
    videoViewController *video = [[videoViewController alloc] init];
    video.ele = self.element;
    video.university = self.university;
    
    video.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.playerView.frame), Kwidth, Kheight - self.playerView.frame.size.height);

    [self.view addSubview:video.tableView];
    
//    NSLog(@"%@",self.childViewControllers);
    if (![self.childViewControllers containsObject:video]) {
        [self addChildViewController:video];
        NSLog(@"%@",self.childViewControllers);
    }
    

}

//- (void)viewWillDisappear:(BOOL)animated {
//
//    [self.navigationController popViewControllerAnimated:YES];
//}



#pragma mark - lazyLoad

- (YTPlayerView *)playerView {
    
    if (!_playerView) {
        _playerView = [[YTPlayerView alloc] init];
    }
    return _playerView;
}




@end
