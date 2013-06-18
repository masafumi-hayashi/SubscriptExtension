//
//  RangeStringParser.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "SubscriptParser.h"
#import "NSString+Convert.h"
#import "NSRegularExpression+SimpleInterface.h"

@implementation SubscriptParser
+ (NSRange)parse:(NSString *)pattern count:(NSUInteger)count
{
    NSArray * matches = [@"^(\\-?[0-9]+)?(.|\\.{2,})?(\\-?[0-9]+)?$".regexp match:pattern];
    if (matches.count == 0) {
        return NSMakeRange(NSNotFound, 0);
    }
    NSTextCheckingResult * result = matches[0];
    NSString * sep = [pattern substringWithRange:[result rangeAtIndex:2]];
    
    if ([sep isEqualToString:@"..."] || [sep isEqualToString:@".."]) {
        NSInteger begin = [[pattern substringWithRange:[result rangeAtIndex:1]] integerValue];
        if (begin < 0) {
            begin = count + begin;
        }
        NSInteger end = [[pattern substringWithRange:[result rangeAtIndex:3]] integerValue];
        if (end < 0) {
            end = count + end;
        }
        if ([sep isEqualToString:@".."]) {
            end += 1;
        }
        return NSMakeRange(begin, end - begin);
    }
    else {
        NSRange locationRange = [result rangeAtIndex:1];
        NSInteger location = 0;
        if (locationRange.location != NSNotFound) {
            location = [[pattern substringWithRange:locationRange] integerValue];
        }
        
        if (location < 0) {
            location = count + location;
        }
        NSInteger length = count - location;
        NSRange range = [result rangeAtIndex:3];
        if (range.location != NSNotFound) {
            length = [[pattern substringWithRange:range] integerValue];
        }
        return NSMakeRange(location, length);
    }
}

+ (NSRange)pattern:(NSString *)pattern target:(NSString *)target
{
    NSArray * match = [@"^(\\D)(.+)\\1(,([0-9]+))?$".regexp match:pattern];
    if (match.count==0) {
        return NSMakeRange(NSNotFound, 0);
    }
    
    NSTextCheckingResult * result = match[0];
    NSString * str = [pattern substringWithRange:[result rangeAtIndex:2]];
    NSArray * submatch = [str.regexp match:target];
    
    NSUInteger index = 0;
    if ([result rangeAtIndex:4].location != NSNotFound) {
        index = [[pattern substringWithRange:[result rangeAtIndex:4]] integerValue];
    }
    NSTextCheckingResult * subresult = submatch[0];
    if (index >= [subresult numberOfRanges]) {
        return NSMakeRange(NSNotFound, 0);
    }
    return [subresult rangeAtIndex:index];
}
@end
