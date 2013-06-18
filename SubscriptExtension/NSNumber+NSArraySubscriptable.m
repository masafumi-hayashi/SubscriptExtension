//
//  NSNumber+NSArraySubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSNumber+NSArraySubscriptable.h"

@implementation NSNumber (NSArraySubscriptable)
- (id)objectForKeyedSubscriptForArray:(NSArray *)array
{
    return array[self.integerValue];
}
@end
