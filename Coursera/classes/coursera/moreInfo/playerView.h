//
//  playerView.h
//  Coursera
//
//  Created by Jefferson on 15/11/1.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface playerView : UIView

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) UIButton *playAndPause;
@property (nonatomic, strong) UIProgressView *progress;

@end
