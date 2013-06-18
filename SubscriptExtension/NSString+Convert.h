//
//  NSString+Convert.h
//  SubscriptExtension
//
//  Created by masafumi hayashi on 5/4/13.
//  Copyright (c) 2013 masafumi hayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)
- (NSRegularExpression *)regexp;
- (NSPredicate *)pred;
- (NSArray *)array;
@end
