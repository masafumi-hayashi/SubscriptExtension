//
//  NSString+Convert.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSString+Convert.h"
@implementation NSString (Convert)
- (NSRegularExpression *)regexp
{
    NSError * error = nil;
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:self
                                                                            options:0
                                                                              error:&error];
    if (error) {
        [NSException exceptionWithName:NSInvalidArgumentException
                                reason:[error localizedDescription]
                              userInfo:@{@"error": error}];
    }
    return regexp;
}

- (NSPredicate *)pred
{
    return [NSPredicate predicateWithFormat:self];
}

- (NSArray *)array
{
    NSMutableArray * text = @[].mutableCopy;
    const NSUInteger length = self.length;
    for (int i = 0; i < length; i++) {
        [text addObject:[self substringWithRange:NSMakeRange(i, 1)]];
    }
    return text;
}
@end
