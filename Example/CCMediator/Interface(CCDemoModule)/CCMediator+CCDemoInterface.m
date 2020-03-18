//
//  CCMediator+CCDemoInterface.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/17.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCMediator+CCDemoInterface.h"

@implementation CCMediator (CCDemoInterface)

- (UIViewController *)pushDemoModuleViewController:(NSDictionary *)parameter {
    UIViewController *vc = [self performTarget:@"CCDemoModule"
                                        action:@"pushDemoModuleViewController:"
                                     parameter:parameter];
    return vc;
}

- (void)presentDemoModuleViewController {
    UIViewController *vc = [self performTarget:@"CCDemoModule"
                                        action:@"presentDemoModuleViewController"];
    [CCMediator.visibleViewController presentViewController:vc
                                                   animated:YES
                                                 completion:nil];
}

- (void)callbackDemoModuleViewController:(void (^)(NSDictionary *))callBack {
    UIViewController *vc = [self performTarget:@"CCDemoModule"
                                        action:@"callbackDemoModuleViewController:"
                                     parameter:@{@"callBack" : callBack}];
    [CCMediator.visibleViewController.navigationController pushViewController:vc
                                                                     animated:YES];
}

@end
