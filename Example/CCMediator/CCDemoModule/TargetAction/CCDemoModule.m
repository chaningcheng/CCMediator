//
//  CCDemoModule.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/13.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCDemoModule.h"
#import "CCDemoModuleViewController.h"

@implementation CCDemoModule

- (UIViewController *)pushDemoModuleViewController:(NSDictionary *)parameter {
    CCDemoModuleViewController *vc = CCDemoModuleViewController.new;
    vc.parameter = parameter;
    return vc;
}

- (UIViewController *)presentDemoModuleViewController {
    CCDemoModuleViewController *vc = CCDemoModuleViewController.new;
    return vc;
}

- (UIViewController *)callbackDemoModuleViewController:(NSDictionary *)parameter {
    CCDemoModuleViewController *vc = CCDemoModuleViewController.new;
    vc.callBack = parameter[@"callBack"];
    return vc;
}

@end
