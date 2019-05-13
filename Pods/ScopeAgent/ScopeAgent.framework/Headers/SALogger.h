//
//  SALogger.h
//  ScopeAgent
//
//  Copyright © 2019 Undefined Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SALogLevel) { notset,  debug, info, warning, error };

@interface SALogger : NSObject
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel filename:(NSString*)filename line:(NSInteger)line fields:(NSDictionary*)fields timestamp:(NSDate*)timestamp NS_SWIFT_NAME(log(_:_:filename:line:fields:timestamp:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel filename:(NSString*)filename line:(NSInteger)line fields:(NSDictionary*)fields NS_SWIFT_NAME(log(_:_:filename:line:fields:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel filename:(NSString*)filename line:(NSInteger)line NS_SWIFT_NAME(log(_:_:filename:line:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel fields:(NSDictionary*)fields timestamp:(NSDate*)timestamp NS_SWIFT_NAME(log(_:_:fields:timestamp:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel fields:(NSDictionary*)fields NS_SWIFT_NAME(log(_:_:fields:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel timestamp:(NSDate*)timestamp NS_SWIFT_NAME(log(_:_:timestamp:));
+(void)log:(NSString*)message logLevel:(SALogLevel)logLevel NS_SWIFT_NAME(log(_:_:));
+(void)log:(NSString*)message NS_SWIFT_NAME(log(_:));
@end

