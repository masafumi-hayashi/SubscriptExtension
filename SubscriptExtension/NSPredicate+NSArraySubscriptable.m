//
//  NSPredicate+NSArraySubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSPredicate+NSArraySubscriptable.h"

@implementation NSPredicate (NSArraySubscriptable)
- (id)objectForKeyedSubscriptForArray:(NSArray *)array
{
    return [array filteredArrayUsingPredicate:self];
}
@end
