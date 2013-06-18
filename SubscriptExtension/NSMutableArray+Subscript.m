//
//  NSMutableArray+Subscript.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSMutableArray+Subscript.h"
#import "NSString+Subscript.h"
#import "SubscriptParser.h"
@implementation NSMutableArray (Subscript)
- (void)setObject:(id)obj atIndexedSubscript:(NSInteger)idx
{
    if (idx < 0) {
        idx = self.count + idx;
    }
    [self replaceObjectAtIndex:idx withObject:obj];
}

- (void)setObject:(id)obj forKeyedSubscript:(id<NSMutableArraySubscriptable>)subscript
{
    if (!subscript || ![subscript conformsToProtocol:@protocol(NSMutableArraySubscriptable)]) {
        [NSException raise:NSInvalidArgumentException
                    format:@"%@ is invalid argument", subscript];
    }
    
    [subscript setObject:obj forKeyedSubscriptForMutableArray:self];
}
@end
