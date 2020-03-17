//
//  CCMediator.h
//  CCMediator
//
//  Created by SimonCheng on 2020/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CCMediatorType) {
    CCMediatorTypeNative,
    CCMediatorTypeWeb,
    CCMediatorTypeOther
};

FOUNDATION_EXTERN NSString *const CCMEDIATOR_SCHEME_NATIVE;
FOUNDATION_EXTERN NSString *const CCMEDIATOR_SCHEME_HTTPS;
FOUNDATION_EXTERN NSString *const CCMEDIATOR_SCHEME_HTTP;

@interface CCMediator : NSObject

+ (instancetype)mediator;

+ (void)unMediator;

/// use URL open module
/// @param URL eg: xxxx://target/action?name=cc
- (id)performActionWithURL:(NSURL *)URL;

/// use target action open module
/// @param target module name
/// @param action action required by modele
- (id)performTarget:(NSString *)target action:(NSString *)action;

/// use target action open module with parameter
/// @param target module name
/// @param action action required by modele
/// @param parameter parameter required by module
- (id)performTarget:(NSString *)target action:(NSString *)action parameter:(NSDictionary *)parameter;

/// current screen view controller
+ (UIViewController *)visibleViewController;

/// dismiss all presented viewcontroller
/// @param animated animated or not
/// @param completion completion action
+ (void)dismissAllPresentedViewControllersAnimated:(BOOL)animated
                                        completion:(void (^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
