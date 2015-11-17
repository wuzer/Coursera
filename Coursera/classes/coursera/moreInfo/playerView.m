//
//  playerView.m
//  Coursera
//
//  Created by Jefferson on 15/11/13.
//  Copyright © 2015年 Jefferson. All rights reserved.
//

#import "playerView.h"
#import <AVFoundation/AVFoundation.h>

#define Kwidth [UIScreen mainScreen].bounds.size.width

@interface playerView ()



@end


@implementation playerView


- (instancetype)init {

    
    self = [super initWithFrame:CGRectMake(0, 0, Kwidth, 240)];
    
    self.backgroundColor = [UIColor redColor];
    
    [self setBaseConfig];
    return self;
}


- (void)setBaseConfig {
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    CGRect rect = self.bounds;
    rect.size.height = self.bounds.size.height;
    playerLayer.frame = rect;
    playerLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.layer addSublayer:playerLayer];
//    [self addSubview:self.playAndPause];
//    [self addSubview:self.progress];
//    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor purpleColor];
//    view.translatesAutoresizingMaskIntoConstraints = false;
//    [self addSubview:view];
//    
//    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
//    
//    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
//    
//    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:[UIScreen mainScreen].bounds.size.width]];
//    
//    [view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44]];
//    
//    
////
//    self.playAndPause.translatesAutoresizingMaskIntoConstraints = false;
//    self.progress.translatesAutoresizingMaskIntoConstraints = false;
    
//    [self.playAndPause addConstraint:[NSLayoutConstraint constraintWithItem:self.playAndPause attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
//    
//    [self.playAndPause addConstraint:[NSLayoutConstraint constraintWithItem:self.playAndPause attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:-236]];
//    
//    [self.playAndPause addConstraint:[NSLayoutConstraint constraintWithItem:self.playAndPause attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
//    
//    [self.playAndPause addConstraint:[NSLayoutConstraint constraintWithItem:self.playAndPause attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30]];
    
    

    
    self.playAndPause.backgroundColor = [UIColor redColor];
    self.progress.backgroundColor = [UIColor blackColor];
}

#pragma mark - lazyLoad


@end
