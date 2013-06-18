//
//  RangeStringParser.h
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubscriptParser : NSObject
+ (NSRange)parse:(NSString *)pattern count:(NSUInteger)count;
+ (NSRange)pattern:(NSString *)pattern target:(NSString *)target;
@end
