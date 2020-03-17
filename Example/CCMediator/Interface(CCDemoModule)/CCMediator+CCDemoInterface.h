//
//  CCMediator+CCDemoInterface.h
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/17.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import <CCMediator/CCMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCMediator (CCDemoInterface)

- (UIViewController *)pushDemoModuleViewControllerWithParameter:(NSDictionary *)parameter;

- (void)mediatorPresentDemoModuleViewController;

@end

NS_ASSUME_NONNULL_END
