//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Adam Lehde on 4/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;

@end
