//
//  NSNumber+NSStringSubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSNumber+NSStringSubscriptable.h"

@implementation NSNumber (NSStringSubscriptable)
- (id)objectForKeyedSubscriptForString:(NSString *)string
{
    NSInteger idx = self.integerValue;
    if (idx < 0) {
        idx = string.length + self.integerValue;
    }
    return [string substringWithRange:NSMakeRange(idx, 1)];
}
@end
