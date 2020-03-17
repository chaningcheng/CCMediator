//
//  CCWebModule.h
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCWebModule : NSObject

- (UIViewController *)pushWKViewControllerWithParameter:(NSDictionary *)parameter;

@end

NS_ASSUME_NONNULL_END
