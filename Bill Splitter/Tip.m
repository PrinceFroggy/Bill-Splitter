//
//  Tip.m
//  Bill Splitter
//
//  Created by Andrew Solesa on 2017-03-18.
//  Copyright © 2017 KSG. All rights reserved.
//

#import "Tip.h"

@implementation Tip

- (NSDecimalNumber *) calculateAmount : (NSDecimalNumber*) amount numberOfPeople: (NSDecimalNumber*) people
{
    return [amount decimalNumberByDividingBy: people];
}

@end
