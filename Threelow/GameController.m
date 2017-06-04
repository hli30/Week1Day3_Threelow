//
//  GameController.m
//  Threelow
//
//  Created by Harry Li on 2017-05-31.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@interface GameController ()

@property (nonatomic) NSInteger gameScore;

@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _holdArray = [NSMutableArray array];
        _randArray = [NSMutableArray array];
        
        for (int i = 0; i < 5; ++i) {
            Dice *die = [Dice new];
            [die rollDie];
            [self.randArray addObject:die];
        }
        
        for (int i = 0; i < 5; ++i) {
            [self.holdArray addObject:[NSNull null]];
        }
    }
    return self;
}

-(void)rollDice{

    for (int i = 0; i < 5; ++i) {
        if(self.randArray[i] == [NSNull null]){
            continue;
        }else{
            [self.randArray[i] rollDie];
        }
    }
    [self showCurrentDiceArrays];
    
}
-(void)holdDice:(NSArray *)input{
    //Replace holdArray at index[input] with randArray at index[input]
    for(int i = 1; i < input.count; ++i){
        NSInteger inputIndex = [input[i] integerValue];
        if(inputIndex < 5){
            [self.holdArray replaceObjectAtIndex:inputIndex withObject: self.randArray[inputIndex]];
            [self.randArray replaceObjectAtIndex:inputIndex withObject:[NSNull null]];
            [self showCurrentDiceArrays];
        }else{
            NSLog(@"**INVALID index number, indexes are 0 - 4**");
        }
    }
}

-(void)unholdDice: (NSArray *)input{
    for(int i = 1; i < input.count; ++i){
        NSInteger inputIndex = [input[i] integerValue];
        if(inputIndex < 5){
            [self.randArray replaceObjectAtIndex:inputIndex withObject: self.holdArray[inputIndex]];
            [self.holdArray replaceObjectAtIndex:inputIndex withObject:[NSNull null]];
            [self showCurrentDiceArrays];
        }else{
            NSLog(@"**INVALID index number, indexes are 0 - 4**");
        }
    }
}
-(void)resetDice{
    for(int i = 0; i < self.holdArray.count; ++i){
        if(self.holdArray[i] == [NSNull null]){
            continue;
        }else{
            [self.randArray replaceObjectAtIndex:i withObject: self.holdArray[i]];
            [self.holdArray replaceObjectAtIndex:i withObject:[NSNull null]];
            [self showCurrentDiceArrays];
        }
    }
}

-(void)showCurrentDiceArrays{
    NSLog(@"Rolled Dice: %@", self.randArray);
    NSLog(@"Held Dice: %@", self.holdArray);
    [self calculateScore];
}

-(void)currentScore:(NSInteger) score{
    NSLog(@"Your current Score is: %ld", score);
}

//Private Method
-(void)calculateScore{
    NSInteger score = 0, totalScore = 0;
    for(int i = 0; i < self.holdArray.count; ++i){
        if (self.holdArray[i] == [NSNull null]) {
            continue;
        }else{
            Dice *die = self.holdArray[i];
            switch (die.dieValue) {
                case 1:
                    score = 1;
                    totalScore += score;
                    break;
                case 2:
                    score = 2;
                    totalScore += score;
                    break;
                case 3:
                    score = 0;
                    totalScore += score;
                    break;
                case 4:
                    score = 4;
                    totalScore += score;
                    break;
                case 5:
                    score = 5;
                    totalScore += score;
                    break;
                case 6:
                    score = 6;
                    totalScore += score;
                    break;
            }
        }
    }
    [self currentScore: totalScore];
}

@end
