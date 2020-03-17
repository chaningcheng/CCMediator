//
//  CCMediator.m
//  CCMediator
//
//  Created by SimonCheng on 2020/3/13.
//

#import "CCMediator.h"
#import <CCMediator/NSUrl+Category.h>
#import <CCMediator/CCMediator+CCWebInterface.h>

NSString *const CCMEDIATOR_SCHEME_NATIVE = @"cxxc";
NSString *const CCMEDIATOR_SCHEME_HTTPS = @"https";
NSString *const CCMEDIATOR_SCHEME_HTTP = @"http";

static dispatch_once_t onceToken;
static CCMediator *mediator;

@implementation CCMediator

#pragma mark - external
+ (instancetype)mediator {
    dispatch_once(&onceToken, ^{
        mediator = CCMediator.new;
    });
    return mediator;
}

+ (void)unMediator {
    onceToken = 0;
    mediator = nil;
}

- (id)performActionWithURL:(NSURL *)URL {
    NSParameterAssert(URL);
    id result;
    
    CCMediatorType type = [URL parseUrlScheme];
    if (type == CCMediatorTypeNative) {
        NSDictionary *parameter = [URL parseUrlQuery];
        NSString *action = [URL.path stringByReplacingOccurrencesOfString:@"/"
                                                               withString:@""];
        if (parameter) {
            result = [self performTarget:URL.host
                                  action:action
                               parameter:parameter];
        } else {
            result = [self performTarget:URL.host
                                  action:action];
        }
    } else { // load custom webview controller
        result = [self loadWebViewControllerWithURL:URL];
    }
    return result;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName {
    return [self performTarget:targetName action:actionName parameter:nil];
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName parameter:(NSDictionary *)parameter {
    NSParameterAssert(targetName);
    NSParameterAssert(actionName);
    
    // target
    Class targetClass = NSClassFromString(targetName);
    NSObject *target = targetClass.new;
    // action
    SEL actionSel = NSSelectorFromString(actionName);

    if (target) {
        if ([target respondsToSelector:actionSel]) {
            return [self performTarget:target
                              selector:actionSel
                             parameter:parameter];
        } else {
            NSParameterAssert(actionSel);
            return nil;
        }
    } else {
        NSParameterAssert(target);
        return nil;
    }
}

+ (UIViewController *)visibleViewController {
    UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (rootViewController.presentedViewController) {
        rootViewController = rootViewController.presentedViewController;
    }
    if ([rootViewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBar = (UITabBarController *)rootViewController;
        rootViewController = tabBar.selectedViewController;
    }
    if ([rootViewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navi = (UINavigationController *)rootViewController;
        rootViewController = navi.visibleViewController;
    }
    return rootViewController;
}

+ (void)dismissAllPresentedViewControllersAnimated:(BOOL)animated
                                        completion:(void (^ _Nullable)(void))completion {
    UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    UIViewController *visibleViewController = [self visibleViewController];
    
    BOOL rootStack = NO;
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBar = (UITabBarController *)rootViewController;
        rootStack = ([tabBar.childViewControllers containsObject:visibleViewController] ||
                     [tabBar.childViewControllers containsObject:visibleViewController.navigationController]);
    } else if ([rootViewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navi = (UINavigationController *)rootViewController;
        rootStack = [navi.childViewControllers containsObject:visibleViewController];
    } else {
        rootStack = (visibleViewController == rootViewController);
    }
    if (rootStack == NO) {
        [visibleViewController dismissViewControllerAnimated:animated completion:^{
            [self dismissAllPresentedViewControllersAnimated:animated completion:completion];
        }];
    } else {
        if (completion) {
            completion();
        }
    }
}

#pragma mark - internal
- (id)performTarget:(NSObject *)target selector:(SEL)selector parameter:(NSDictionary *)parameter {
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:selector];
    if (methodSignature) {
        const char *methodReturnType = [methodSignature methodReturnType];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        if (parameter) {
            [invocation setArgument:&parameter
                            atIndex:2];
        }
        invocation.selector = selector;
        invocation.target = target;
        if (strcmp(methodReturnType, @encode(void)) == 0) {
            [invocation invoke];
            return nil;
        } else if (strcmp(methodReturnType, @encode(BOOL)) == 0) {
            [invocation invoke];
            BOOL result;
            [invocation getReturnValue:&result];
            return @(result);
        } else if (strcmp(methodReturnType, @encode(NSUInteger)) == 0) {
            [invocation invoke];
            NSUInteger result;
            [invocation getReturnValue:&result];
            return @(result);
        } else if (strcmp(methodReturnType, @encode(NSInteger)) == 0) {
            [invocation invoke];
            NSInteger result;
            [invocation getReturnValue:&result];
            return @(result);
        } else if (strcmp(methodReturnType, @encode(CGFloat)) == 0) {
            [invocation invoke];
            CGFloat result;
            [invocation getReturnValue:&result];
            return @(result);
        } else {
            id result;
            if (parameter) {
                result = [target performSelector:selector withObject:parameter];
            } else {
                result = [target performSelector:selector];
            }
            return result;
        }
    } else {
        return nil;
    }
}

@end
