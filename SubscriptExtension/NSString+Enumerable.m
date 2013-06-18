//
//  NSString+Enumerable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+Enumerable.h"

@implementation NSString (Enumerable) 
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len
{
    int count = 0;
    if (state->state == 0) {
        state->mutationsPtr = &state->extra[0];
    }
    const NSUInteger length = self.length;
    if (state->state < length) {
        state->itemsPtr = buffer;
        while ((state->state < length) && (count < len)) {
            buffer[count] = [self substringWithRange:NSMakeRange(count, 1)];
            state->state++;
            count++;
        }
    }
    else {
        count = 0;
    }
    
    return count;
}

@end
