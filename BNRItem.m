//
//  BNRItem.m
//  Homepwner
//
//  Created by Adam Lehde on 4/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"FLuffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of ta random adjective/noun from the lists
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
                            
    int randomValue = arc4random() %100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() %10, 'A' + arc4random() % 26, '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber{
    //call the super's designated init
    self = [super init];
    
    //did the super's designated init succeed?
    if(self){
        //give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        //set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc]init];
        
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init{
    return [self initWithItemName:@"Item"];
}

- (void)setItemName:(NSString *)str{
    _itemName = str;
}
- (NSString *)itemName{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str{
    _serialNumber = str;
}
- (NSString *)serialNumber{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v{
    _valueInDollars = v;
}
- (int)valueInDollars{
    return _valueInDollars;
}

- (NSDate *)dateCreated{
    return _dateCreated;
}


- (NSString *)description{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

@end
