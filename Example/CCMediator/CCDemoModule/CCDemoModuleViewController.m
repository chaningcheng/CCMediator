//
//  CCDemoModuleViewController.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/13.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCDemoModuleViewController.h"

@interface CCDemoModuleViewController ()

@end

@implementation CCDemoModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.orangeColor;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"parameter"
                                                                   message:[NSString stringWithFormat:@"%@", self.parameter]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

- (void)dealloc {
    if (self.callBack) {
        self.callBack(@{@"name" : @"cxxc"});
    }
}

@end
