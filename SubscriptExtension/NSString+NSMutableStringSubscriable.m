//
//  NSString+NSMutableStringSubscriable.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+NSMutableStringSubscriable.h"
#import "NSString+Convert.h"
#import "NSRegularExpression+SimpleInterface.h"
#import "SubscriptParser.h"

@implementation NSString (NSMutableStringSubscriable)
- (void)setObject:(id)obj forKeyedSubscriptForString:(NSMutableString *)string
{
    NSArray * match = [@"^(\\D)(.+)\\1(,([0-9]+))?$".regexp match:self];
    if (match.count) {
        NSTextCheckingResult * result = match[0];
        NSString * str = [self substringWithRange:[result rangeAtIndex:2]];
        NSRange range = [result rangeAtIndex:4];
        if (range.location == NSNotFound) {
            [str.regexp replaceMatchesInString:string
                                       options:0
                                         range:NSMakeRange(0, string.length)
                                  withTemplate:obj];
        }
        else {
            NSArray * matches = [str.regexp match:string];
            NSInteger index = [self substringWithRange:range].integerValue;
            if (matches.count) {
                NSRange range = [matches[0] rangeAtIndex:index];
                [string replaceCharactersInRange:range withString:obj];
            }
        }
    }
    else {
        NSRange range = [SubscriptParser parse:self count:string.length];
        if (range.location == NSNotFound) {
            return;
        }
        
        if ([obj isKindOfClass:[NSString class]]) {
            [string replaceCharactersInRange:range withString:obj];
        }
    }
}
@end
