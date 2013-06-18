//
//  NSRegularExpression+SimpleInterface.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSRegularExpression+SimpleInterface.h"

@implementation NSRegularExpression (SimpleInterface)
- (NSArray *)match:(NSString *)str
{
    return [self matchesInString:str
                         options:0
                           range:NSMakeRange(0, [str length])];
}
@end
