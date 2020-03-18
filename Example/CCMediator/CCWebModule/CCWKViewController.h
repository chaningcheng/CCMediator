//
//  CCWKViewController.h
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCWKViewController : UIViewController

@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, copy  ) NSDictionary *parameter;

@end

NS_ASSUME_NONNULL_END
