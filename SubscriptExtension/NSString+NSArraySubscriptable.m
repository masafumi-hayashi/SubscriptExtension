//
//  NSString+NSArraySubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+NSArraySubscriptable.h"
#import "SubscriptParser.h"

@implementation NSString (NSArraySubscriptable)
- (id)objectForKeyedSubscriptForArray:(NSArray *)array
{
    NSRange range = [SubscriptParser parse:self count:array.count];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    return [array subarrayWithRange:range];
}
@end
