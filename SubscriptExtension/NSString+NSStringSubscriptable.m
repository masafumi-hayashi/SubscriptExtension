//
//  NSString+NSStringSubscriptable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+NSStringSubscriptable.h"
#import "SubscriptParser.h"

@implementation NSString (NSStringSubscriptable)
- (id)objectForKeyedSubscriptForString:(NSString *)string
{
    NSRange r = [SubscriptParser pattern:self target:string];
    if (r.location != NSNotFound) {
        return [string substringWithRange:r];
    }
    
    NSRange range = [SubscriptParser parse:self count:string.length];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    return [string substringWithRange:range];
}
@end
