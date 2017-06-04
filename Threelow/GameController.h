//
//  GameController.h
//  Threelow
//
//  Created by Harry Li on 2017-05-31.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (nonatomic, strong)NSMutableArray *holdArray;
@property (nonatomic, strong)NSMutableArray *randArray;

-(void)rollDice;
-(void)holdDice:(NSArray *)input;
-(void)unholdDice:(NSArray *)input;
-(void)resetDice;
-(void)showCurrentDiceArrays;
-(void)currentScore:(NSInteger) score;


@end
