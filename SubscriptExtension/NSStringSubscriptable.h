//
//  NSStringSubscriptable.h
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/6/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSStringSubscriptable <NSObject>
- (id)objectForKeyedSubscriptForString:(NSString *)string;
@end