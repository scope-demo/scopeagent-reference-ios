
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAURLSessionObserver : NSURLProtocol<NSURLSessionDelegate>

+(NSURLSessionConfiguration*) defaultSessionConfiguration;
+(NSURLRequest*)adapt:(NSURLRequest*)urlRequest;

@end

NS_ASSUME_NONNULL_END
