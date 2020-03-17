//
//  CCViewController.m
//  CCMediator
//
//  Created by chaningcheng on 03/17/2020.
//  Copyright (c) 2020 chaningcheng. All rights reserved.
//

#import "CCViewController.h"
#import <CCMediator/CCMediator.h>
#import <CCMediator/NSURL+Category.h>
#import "CCMediator+CCWebInterface.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"cxxc://CCDemoModule/pushDemoModuleViewController:?name=cc"];
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com?name=cc"];
    UIViewController *vc = [CCMediator.mediator performActionWithURL:url];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
