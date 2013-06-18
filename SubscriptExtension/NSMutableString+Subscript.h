//
//  NSMutableString+Subscript.h
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/5/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableStringSubscriptable.h"

@interface NSMutableString (Subscript)
- (void)setObject:(id)obj atIndexedSubscript:(NSInteger)idx;
- (void)setObject:(id)obj forKeyedSubscript:(id<NSMutableStringSubscriptable>)subscript;
@end
