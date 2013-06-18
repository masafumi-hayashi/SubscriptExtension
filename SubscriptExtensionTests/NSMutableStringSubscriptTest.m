//
//  NSMutableStringSubscriptTest.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSMutableStringSubscriptTest.h"
#import "NSMutableString+Subscript.h"
#import "NSString+Convert.h"
#import "NSString+NSMutableStringSubscriable.h"
#import "NSRegularExpression+NSMutableStringSubscriptable.h"

@interface NSMutableStringSubscriptTest ()
@property (nonatomic) NSMutableString * data;
@end

@implementation NSMutableStringSubscriptTest
- (void)setUp
{
    self.data = @"sample".mutableCopy;
}

- (void)testIntegerAccess
{
    self.data[0] = @"x";
    STAssertEqualObjects(self.data, @"xample", nil);
    
    STAssertThrows((self.data[20] = @"c"), nil);
}

- (void)testNegativeIntegerAccess
{
    self.data[-1] = @"x";
    STAssertEqualObjects(self.data, @"samplx", nil);
}

- (void)testLocationAndLengthAccess
{
    self.data[@"1,1"] = @"x";
    STAssertEqualObjects(self.data, @"sxmple", nil);
}

- (void)testLocationAndLengthAccess2
{
    self.data[@"1,"] = @"x";
    STAssertEqualObjects(self.data, @"sx", nil);
}

- (void)testLocationAndLengthAccess3
{
    self.data[@",1"] = @"x";
    STAssertEqualObjects(self.data, @"xample", nil);
    
    self.data[@",2"] = @"y";
    STAssertEqualObjects(self.data, @"ymple", nil);
    
    self.data[@",1"] = @"xy";
    STAssertEqualObjects(self.data, @"xymple", nil);
}

- (void)testRangeAccess
{
    self.data[@"1..2"] = @"x";
    STAssertEqualObjects(self.data, @"sxple", nil);
}

- (void)testRangeAccess2
{
    self.data[@"1...2"] = @"x";
    STAssertEqualObjects(self.data, @"sxmple", nil);
}

- (void)testNegativeRangeAccess
{
    self.data[@"-2..-1"] = @"x";
    STAssertEqualObjects(self.data, @"sampx", nil);
}

- (void)testNegativeRangeAccess2
{
    self.data[@"-2...-1"] = @"x";
    STAssertEqualObjects(self.data, @"sampxe", nil);
    [NSString stringWithFormat:@"%d...%d", 1, 2];
}

- (void)testRegularExpressionAccess
{
    self.data[@"[ae]".regexp] = @"x";
    STAssertEqualObjects(self.data, @"sxmplx", nil);
}

- (void)testRegularExpressionStringAccess
{
    self.data[@"/[ae]/"] = @"x";
    STAssertEqualObjects(self.data, @"sxmplx", nil);
}

- (void)testRegularExpressionStringAccess2
{
    NSMutableString * text = @"hello world".mutableCopy;
    text[@"/hell(o) w(o)rld/,2"] = @"x";
    STAssertEqualObjects(text, @"hello wxrld", nil);
    
    text[@"/he(l)(l)o wxr(l)d/,1"] = @"q";
    STAssertEqualObjects(text, @"heqlo wxrld", nil);
    
    text[@"/l/"] = @"q";
    STAssertEqualObjects(text, @"heqqo wxrqd", nil);
}

- (void)testInvalidArgument
{
    NSString * text = nil;
    STAssertThrows((void)(self.data[text] = @"test"), nil);
}
@end
