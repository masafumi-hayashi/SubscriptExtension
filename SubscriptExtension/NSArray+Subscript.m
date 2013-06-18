//
//  NSArray+Subscript.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSArray+Subscript.h"
#import "NSString+Convert.h"
#import "NSRegularExpression+SimpleInterface.h"
#import "SubscriptParser.h"
@implementation NSArray (Subscript)
- (id)objectAtIndexedSubscript:(NSInteger)idx
{
    if (idx < 0) {
        idx = self.count + idx;
    }
    if (idx >= self.count) {
        return nil;
    }
    return [self objectAtIndex:idx];
}

- (id)objectForKeyedSubscript:(id<NSArraySubscriptable>)key
{
    if (!key || ![key conformsToProtocol:@protocol(NSArraySubscriptable)]) {
        [NSException raise:NSInvalidArgumentException
                    format:@"%@ is invalid argument", key];
    }
    
    return [key objectForKeyedSubscriptForArray:self];
}

@end
