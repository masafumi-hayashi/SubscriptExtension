//
//  NSStringSubScriptingTest.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSStringSubScriptingTest.h"
#import "NSString+Subscript.h"
#import "NSString+Enumerable.h"
#import "NSString+Convert.h"
#import "NSNumber+NSStringSubscriptable.h"
#import "NSString+NSStringSubscriptable.h"
#import "NSRegularExpression+NSStringSubscriptable.h"

@interface NSStringSubScriptingTest ()
@property (nonatomic) NSString * data;
@end

@implementation NSStringSubScriptingTest


- (void)setUp
{
    self.data = @"sample";
}

- (void)testIntegerAccess
{
    STAssertEqualObjects(self.data[1], @"a", nil);
    STAssertEqualObjects(self.data[20], nil, nil);
    STAssertEqualObjects(@"hello world"[1], @"e", nil);
    STAssertEqualObjects(@"hello world"[10], @"d", nil);
    STAssertEqualObjects(@"hello world"[11], nil, nil);
}

- (void)testNegativeIntegerAccess
{
    STAssertEqualObjects(self.data[-1], @"e", nil);
    STAssertEqualObjects(self.data[-20], nil, nil);
    STAssertEqualObjects(@"hello world"[-1], @"d", nil);
    STAssertEqualObjects(@"hello world"[-11], @"h", nil);
    STAssertEqualObjects(@"hello world"[-12], nil, nil);
}

- (void)testLocationAndLengthStringAccess
{
    STAssertEqualObjects(self.data[@"1,1"], @"a", nil);
    STAssertEqualObjects(self.data[@"1,"], @"ample", nil);
    STAssertEqualObjects(self.data[@",1"], @"s", nil);
}

- (void)testRangeStringAccess
{
    STAssertEqualObjects(self.data[@"0..2"], @"sam", nil);
    STAssertEqualObjects(self.data[@"1..2"], @"am", nil);
    STAssertEqualObjects(self.data[@"0...2"], @"sa", nil);
    STAssertEqualObjects(self.data[@"1...2"], @"a", nil);
}

- (void)testNegativeRangeStringAccess
{
    STAssertEqualObjects(self.data[@"-5..-1"], @"ample", nil);
    STAssertEqualObjects(self.data[@"-5...-1"], @"ampl", nil);
}

- (void)testRegularExpressionStringAccessGetFirstResult
{
    STAssertEqualObjects(self.data[@"/[a-z]/"], @"s", nil);
    STAssertEqualObjects(self.data[@"/[a-z]{3}/"], @"sam", nil);
    STAssertEqualObjects(self.data[@"%[a-z]{3}%"], @"sam", nil);
}

- (void)testRegularExpressionStringAccessGetResultAtIndex
{
    STAssertEqualObjects(self.data[@"/s(a)mpl(e)/,0"], @"sample", nil);
    STAssertEqualObjects(self.data[@"/s(a)mpl(e)/,1"], @"a", nil);
    STAssertEqualObjects(self.data[@"/s(a)mpl(e)/,2"], @"e", nil);
    STAssertEqualObjects(self.data[@"/(a)/,0"], @"a", nil);
    STAssertEqualObjects(self.data[@"/(a)/,1"], @"a", nil);
    STAssertEqualObjects(self.data[@"/(a)/,2"], nil, nil);
    STAssertEqualObjects(self.data[@"/amp/"], @"amp", nil);    
}

- (void)testRegularExpressionAccess
{
    STAssertEqualObjects(self.data[@"amp".regexp], @"amp", nil);
}

- (void)testInvalidArgumentAccess
{
    NSString * key = nil;
    STAssertThrows((void)self.data[key], nil);
}
@end
