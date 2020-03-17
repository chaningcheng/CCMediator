//
//  CCMediator.h
//  CCMediator
//
//  Created by SimonCheng on 2020/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 类型
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

/// 通过 URL 调用其他模块
/// @param URL 对应模块的 url eg: xxxx://target/action?name=cc
- (id)performActionWithURL:(NSURL *)URL;

/// 通过 runtime 动态调用其他模块
/// @param target 模块名称
/// @param action 模块需要做的事情
- (id)performTarget:(NSString *)target action:(NSString *)action;

/// 通过 runtime 动态调用其他模块
/// @param target 模块名称
/// @param action 模块需要做的事情
/// @param parameter 模块需要的参数
- (id)performTarget:(NSString *)target action:(NSString *)action parameter:(NSDictionary *)parameter;

@end

NS_ASSUME_NONNULL_END
