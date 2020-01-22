
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAURLSessionObserver : NSURLProtocol

+ (NSURLRequest *)adapt:(NSURLRequest *)urlRequest;
+ (NSURLSessionConfiguration *)adaptConfiguration:(NSURLSessionConfiguration *)urlSessionConfiguration;
+ (NSURLSessionConfiguration *)defaultSessionConfiguration;

@end

NS_ASSUME_NONNULL_END
