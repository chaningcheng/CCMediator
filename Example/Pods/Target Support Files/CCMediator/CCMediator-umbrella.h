#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "CCMediator.h"
#import "CCMediator+CCWebInterface.h"
#import "NSURL+Category.h"

FOUNDATION_EXPORT double CCMediatorVersionNumber;
FOUNDATION_EXPORT const unsigned char CCMediatorVersionString[];

