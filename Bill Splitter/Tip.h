//
//  Tip.h
//  Bill Splitter
//
//  Created by Andrew Solesa on 2017-03-18.
//  Copyright © 2017 KSG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tip : NSObject

- (NSDecimalNumber *) calculateAmount : (NSDecimalNumber*) amount numberOfPeople: (NSDecimalNumber*) people;

@end
