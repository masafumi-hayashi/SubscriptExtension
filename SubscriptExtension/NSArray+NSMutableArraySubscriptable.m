//
//  NSArray+NSMutableArraySubscriptImplements.m
//  SubscriptExtensions
//
//  Created by masafumi hayashi on 6/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSArray+NSMutableArraySubscriptable.h"

@implementation NSArray (NSMutableArraySubscriptable)
- (void)setObject:(id)obj forKeyedSubscriptForMutableArray:(NSMutableArray *)array
{
    NSNumber * a = self[0];
    NSNumber * b = self[1];
    NSArray * objects = obj;
    if (![objects isKindOfClass:[NSArray class]]) {
        objects = @[objects];
    }
    
    if (!b) {
        b = @([objects count]);
    }
    [array replaceObjectsInRange:NSMakeRange(a.integerValue, b.integerValue)
            withObjectsFromArray:objects
                           range:NSMakeRange(0, [objects count])];
}
@end
