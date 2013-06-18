//
//  NSStringConvert.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSStringConvertTest.h"
#import "NSString+Convert.h"

@implementation NSStringConvertTest

- (void)testConvertRegexp
{
    NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:@"sample"
                                                                             options:0
                                                                               error:nil];
    STAssertEqualObjects(@"sample".regexp, regexp, nil);
}

- (void)testConvertPredicate
{
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF == 'b'"];
    STAssertEqualObjects(@"SELF == 'b'".pred, pred, nil);
}
@end
