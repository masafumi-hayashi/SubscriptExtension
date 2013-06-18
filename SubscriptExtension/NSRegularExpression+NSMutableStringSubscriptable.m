//
//  NSRegularExpression+NSMutableStringSubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSRegularExpression+NSMutableStringSubscriptable.h"

@implementation NSRegularExpression (NSMutableStringSubscriptable)
- (void)setObject:(id)obj forKeyedSubscriptForString:(NSMutableString *)string
{
    [self replaceMatchesInString:string
                           options:0
                             range:NSMakeRange(0, string.length)
                      withTemplate:obj];
}
@end
