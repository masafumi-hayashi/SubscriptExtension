//
//  NSRegularExpression+NSStringSubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSRegularExpression+NSStringSubscriptable.h"

@implementation NSRegularExpression (NSStringSubscriptable)
- (id)objectForKeyedSubscriptForString:(NSString *)string
{
    NSArray * match = [self matchesInString:string
                                      options:0
                                        range:NSMakeRange(0, string.length)];
    NSTextCheckingResult * result = match[0];
    return [string substringWithRange:[result rangeAtIndex:0]];
}
@end
