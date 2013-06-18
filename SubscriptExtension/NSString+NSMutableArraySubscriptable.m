//
//  NSString+NSMutableArraySubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+NSMutableArraySubscriptable.h"
#import "SubscriptParser.h"

@implementation NSString (NSMutableArraySubscriptable)
- (void)setObject:(id)obj forKeyedSubscriptForMutableArray:(NSMutableArray *)array
{
    if (!obj) {
        return;
    }
    NSRange range = [SubscriptParser parse:self
                                     count:array.count];
    if (range.location == NSNotFound) {
        return;
    }
    
    NSArray * a = obj;
    if (![obj isKindOfClass:[NSArray class]]) {
        a = @[obj];
    }
    [array replaceObjectsInRange:range
            withObjectsFromArray:a
                           range:NSMakeRange(0, [a count])];
}
@end
