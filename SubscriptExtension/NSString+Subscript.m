//
//  NSString+Subscript.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+Subscript.h"

@implementation NSString (Subscript)
- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    if (idx < 0) {
        if (idx < -self.length) {
            return nil;
        }
        idx = [self length] + idx;
    }
    else if (idx >= [self length]) {
        return nil;
    }
    
    return [self substringWithRange:NSMakeRange(idx, 1)];
}

- (id)objectForKeyedSubscript:(id<NSStringSubscriptable>)key
{
    if (![key conformsToProtocol:@protocol(NSStringSubscriptable)]) {
        [NSException raise:NSInvalidArgumentException
                    format:@"%@ is invalid argument", key];
    }
    return [key objectForKeyedSubscriptForString:self];
}

@end
