//
//  NSMutableString+Subscript.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSMutableString+Subscript.h"

@implementation NSMutableString (Subscript)
- (void)setObject:(id)obj atIndexedSubscript:(NSInteger)idx
{
    if (idx < 0) {
        idx = self.length + idx;
    }
    
    [self replaceCharactersInRange:NSMakeRange(idx, 1)
                        withString:obj];
}

- (void)setObject:(id)obj forKeyedSubscript:(id<NSMutableStringSubscriptable>)subscript
{
    if (!subscript || ![subscript conformsToProtocol:@protocol(NSMutableStringSubscriptable)]) {
        [NSException raise:NSInvalidArgumentException
                    format:@"%@ is invalid argument", subscript];
    }
    
    [subscript setObject:obj forKeyedSubscriptForString:self];
}
@end
