//
//  NSArraySubscriptTest.m
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import "NSArraySubscriptTest.h"
#import "NSArray+Subscript.h"
#import "NSString+Enumerable.h"
#import "NSString+Convert.h"
#import "NSNumber+NSArraySubscriptable.h"
#import "NSString+NSArraySubscriptable.h"
#import "NSPredicate+NSArraySubscriptable.h"
#import "NSArray+NSArraySubscriptable.h"

@interface NSArraySubscriptTest ()
@property (nonatomic) NSArray * data;
@end

@implementation NSArraySubscriptTest

- (void)setUp
{    
    self.data = @"sample".array.mutableCopy;
}

- (void)testIntegerAccess
{
    STAssertEqualObjects(self.data[0], @"s", nil);
}

- (void)testNegativeIntegerAccess
{
    STAssertEqualObjects(self.data[-1], @"e", nil);
}

- (void)testNSNumberAccess
{
    STAssertEqualObjects(self.data[@1], @"a", nil);
}

- (void)testNegativeNSNumberAccess
{
    STAssertEqualObjects(self.data[@-1], @"e", nil);
}


- (void)testLocationAndLengthAccess
{
    STAssertEqualObjects(self.data[@"1,1"], (@[@"a"]), nil);
    STAssertEqualObjects(self.data[@"1,"], (@[@"a", @"m", @"p", @"l", @"e"]), nil);
    STAssertEqualObjects(self.data[@",2"], (@[@"s",@"a"]), nil);
}

- (void)testRangeAccess
{
    STAssertEqualObjects(self.data[@"0..1"], (@[@"s", @"a"]), nil);
    STAssertEqualObjects(self.data[@"0...1"], (@[@"s"]), nil);
}

- (void)testNegativeRangeAccess
{
    STAssertEqualObjects(self.data[@"-2..-1"], (@[@"l",@"e"]), nil);
    STAssertEqualObjects(self.data[@"-2...-1"], (@[@"l"]), nil);
}

- (void)testArrayAccess
{
    STAssertEqualObjects(self.data[(@[@1,@1])], @[@"a"], nil);
    STAssertEqualObjects(self.data[(@[@1])], (@[@"a",@"m", @"p", @"l", @"e"]), nil);
    STAssertEqualObjects(self.data[(@[@-2,@1])], @[@"l"], nil);
}

- (void)testPredicateAccess
{
    STAssertEqualObjects(self.data[@"SELF=='a'".pred], @[@"a"], nil);
    
    NSArray * text = @"HELLO world".array;
    STAssertEqualObjects(text[@"SELF contains[c] 'l'".pred], (@[@"L",@"L",@"l"]), nil);
}

- (void)testInvalidArgument
{
    NSString * text = nil;
    STAssertThrows((void)self.data[text], nil);
}
@end
