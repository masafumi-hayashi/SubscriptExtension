//
//  NSString+Subscript.h
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSStringSubscriptable.h"

@interface NSString (Subscript)
- (id)objectAtIndexedSubscript:(NSInteger)idx;
- (id)objectForKeyedSubscript:(id<NSStringSubscriptable>)key;
@end
