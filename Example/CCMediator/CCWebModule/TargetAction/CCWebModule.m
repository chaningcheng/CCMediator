//
//  CCWebModule.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCWebModule.h"
#import "CCWKViewController.h"

@implementation CCWebModule

- (UIViewController *)pushWKViewControllerWithParameter:(NSDictionary *)parameter {
    CCWKViewController *vc = CCWKViewController.new;
    vc.URL = parameter[@"URL"];
    vc.parameter = parameter[@"parameter"];
    return vc;
}

@end
