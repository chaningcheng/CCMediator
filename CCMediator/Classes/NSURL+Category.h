//
//  NSURL+Category.h
//  CCMediator
//
//  Created by SimonCheng on 2020/3/16.
//

#import <Foundation/Foundation.h>
#import <CCMediator/CCMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Category)

- (CCMediatorType)parseUrlScheme;

- (NSDictionary *)parseUrlQuery;

@end

NS_ASSUME_NONNULL_END
