//
//  NSMutableArraySubscriptTest.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSMutableArraySubscriptTest.h"
#import "NSMutableArray+Subscript.h"
#import "NSString+Enumerable.h"
#import "NSString+NSMutableArraySubscriptable.h"
#import "NSArray+NSMutableArraySubscriptable.h"

@interface NSMutableArraySubscriptTest ()
@property (nonatomic) NSMutableArray * data;
@end

@implementation NSMutableArraySubscriptTest

- (void)setUp
{
    self.data = @[@"s", @"a", @"m", @"p", @"l", @"e"].mutableCopy;
}

- (void)testIntegerAccess
{
    self.data[1] = @"x";
    STAssertEqualObjects(self.data[1], @"x", nil);
}

- (void)testNegativeIntegerAccess
{
    self.data[-2] = @"x";
    STAssertEqualObjects(self.data[-2], @"x", nil);
}

- (void)testRangeStringAccess
{
    self.data[@"0..1"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[0], @"x", nil);
    STAssertEqualObjects(self.data[1], @"y", nil);
}

- (void)testRangeStringAccess2
{
    self.data[@"0...1"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[0], @"x", nil);
    STAssertEqualObjects(self.data[1], @"y", nil);
    STAssertEqualObjects(self.data[2], @"a", nil);
    STAssertTrue(self.data.count == 7, nil);
}

- (void)testNegativeRangeStringAccess
{
    self.data[@"-2..-1"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[4], @"x", nil);
    STAssertEqualObjects(self.data[5], @"y", nil);
}

- (void)testNegativeRangeStringAccess2
{
    self.data[@"-2...-1"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[4], @"x", nil);
    STAssertEqualObjects(self.data[5], @"y", nil);
    STAssertEqualObjects(self.data[6], @"e", nil);
    STAssertTrue(self.data.count == 7, nil);
}

- (void)testLocationAndLengthAccess
{
    self.data[@"0,2"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[0], @"x", nil);
    STAssertEqualObjects(self.data[1], @"y", nil);
}

- (void)testLocationAndLengthAccess2
{
    self.data[@"1,"] = @[@"x", @"y"];
    STAssertEqualObjects(self.data[1], @"x", nil);
    STAssertEqualObjects(self.data[2], @"y", nil);
    STAssertTrue(self.data.count == 3, nil);
}

- (void)testLocationandLengthAccess3
{
    self.data[@",2"] = @[@"x",@"y"];
    STAssertEqualObjects(self.data[0], @"x", nil);
    STAssertEqualObjects(self.data[1], @"y", nil);
}

- (void)testNilAccess
{
    NSString * text = nil;
    STAssertEqualObjects(text, nil, nil);
    STAssertThrows((void)(self.data[text] = @"x"), nil);
}

- (void)testArraySubstitution
{
    self.data[@[@0,@3]] = @[@"h",@"e", @"l"];
    STAssertEqualObjects([self.data componentsJoinedByString:@""], @"helple", nil);
}

- (void)testArraySubstitutionLessItems
{
    self.data[@[@0,@3]] = @[@"h", @"e"];
    STAssertEqualObjects([self.data componentsJoinedByString:@""], @"heple", nil);
}

- (void)testArraySubstitutionMoreItems
{
    self.data[@[@0,@3]] = @[@"h", @"e", @"l", @"l"];
    STAssertEqualObjects([self.data componentsJoinedByString:@""], @"hellple", nil);
}

- (void)testArraySubstitutionOnlyLocation
{
    self.data[@[@0]] = @[@"h", @"e", @"l"];
    STAssertEqualObjects([self.data componentsJoinedByString:@""], @"helple", nil);
} 
@end
