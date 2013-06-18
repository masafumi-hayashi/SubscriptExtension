//
//  NSArray+NSArraySubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSArray+NSArraySubscriptable.h"

@implementation NSArray (NSArraySubscriptable)
- (id)objectForKeyedSubscriptForArray:(NSArray *)array
{
    NSInteger begin = [self[0] integerValue];
    if (begin < 0) {
        begin = array.count + begin;
    }
    NSInteger length = [self[1] integerValue];
    if (length==0) {
        length = array.count - begin;
    }
    return [array subarrayWithRange:NSMakeRange(begin, length)];

}
@end
