//
//  CCMediator+CCWebInterface.h
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import <CCMediator/CCMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCMediator (CCWebInterface)

- (UIViewController *)loadWebViewControllerWithURL:(NSURL *)URL;

@end

NS_ASSUME_NONNULL_END
