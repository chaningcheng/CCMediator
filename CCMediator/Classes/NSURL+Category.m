//
//  NSURL+Category.m
//  CCMediator
//
//  Created by SimonCheng on 2020/3/16.
//

#import "NSURL+Category.h"

@implementation NSURL (Category)

- (CCMediatorType)parseUrlScheme {
    NSString *scheme = self.scheme.lowercaseString;
    if ([scheme isEqualToString:CCMEDIATOR_SCHEME_NATIVE]) {
        return CCMediatorTypeNative;
    } else if ([scheme isEqualToString:CCMEDIATOR_SCHEME_HTTPS] ||
               [scheme isEqualToString:CCMEDIATOR_SCHEME_HTTP]) {
        return CCMediatorTypeWeb;
    } else {
        return CCMediatorTypeOther;
    }
}

- (NSDictionary *)parseUrlQuery {
    NSMutableDictionary *parameters = NSMutableDictionary.dictionary;
    NSURLComponents *components = [NSURLComponents componentsWithURL:self
                                             resolvingAgainstBaseURL:YES];
    [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [parameters setObject:obj.value ? : @"" forKey:obj.name];
    }];
    return parameters;
}

@end
