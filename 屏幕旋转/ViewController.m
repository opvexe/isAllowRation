//
//  ViewController.m
//  屏幕旋转
//
//  Created by jieku on 2017/5/11.
//  Copyright © 2017年 TSM. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appDele.isAllowRotation = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(allowRevolve:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    
}

- (void)allowRevolve:(NSNotification*)notify {
    
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait
        
        || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {

        //竖屏操作
        
    } else {
        //横屏操作
        
    }
}

//移除通知
-(void)viewWillDisappear:(BOOL)animated

{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    AppDelegate *appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appDele.isAllowRotation = NO;
    
    //由横屏状态的屏幕返回竖屏屏幕的时候添加以下处理
    
    NSNumber *orientationUnknown = [NSNumber numberWithInt:0];
    
    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:1];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

@end
