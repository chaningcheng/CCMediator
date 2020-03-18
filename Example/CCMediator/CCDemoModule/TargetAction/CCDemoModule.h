//
//  CCDemoModule.h
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/13.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCDemoModule : NSObject

- (UIViewController *)pushDemoModuleViewController:(NSDictionary *)parameter;
- (UIViewController *)presentDemoModuleViewController;
- (UIViewController *)callbackDemoModuleViewController:(NSDictionary *)parameter;

@end

NS_ASSUME_NONNULL_END
