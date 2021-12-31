//
//  GJTest.h
//  SwiftAdvancedErrorDemo
//
//  Created by Guo on 2021/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJTest : NSObject

- (void)contentsOfFile:(NSString *)filename error:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
