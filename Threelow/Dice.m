//
//  Dice.m
//  Threelow
//
//  Created by Harry Li on 2017-05-31.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(NSString *)description{
    return [NSString stringWithFormat:@"%ld",self.dieValue];
}

-(void)rollDie{
    self.dieValue = arc4random_uniform(6) + 1;
}


@end
