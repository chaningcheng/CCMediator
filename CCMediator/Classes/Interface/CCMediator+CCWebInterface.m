//
//  CCMediator+CCWebInterface.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCMediator+CCWebInterface.h"
#import <CCMediator/NSURL+Category.h>

@implementation CCMediator (CCWebInterface)

- (UIViewController *)loadWebViewControllerWithURL:(NSURL *)URL {
    UIViewController *vc = [self performTarget:@"CCWebModule"
                                        action:@"pushWKViewControllerWithParameter:"
                                     parameter:@{@"URL" : URL,
                                                 @"parameter" : [URL parseUrlQuery]
                                     }];
    return vc;
}

@end
