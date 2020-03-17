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
    
    NSLog(@"CCDemoModuleViewController - parameter: %@", self.parameter);
}

@end
