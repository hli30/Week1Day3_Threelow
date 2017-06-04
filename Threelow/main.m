//
//  main.m
//  Threelow
//
//  Created by Harry Li on 2017-05-31.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputHandler *input = [InputHandler new];
        GameController *game = [GameController new];
        
        NSLog(@"\nGame Begin");
        [game showCurrentDiceArrays];
        
        while (true) {
            NSString *userInput = [input inputForPrompt:@"\nWhat would you like to do? \nroll - Roll Dice \nhold - Hold Dice at Index (0-4; e.g. hold 2 3)\nunhold - Unhold Dice at Index (0-4)\nreset - Reset All Held Dice\n>"];
            NSArray *inputArray = [userInput componentsSeparatedByString:@" "];
            
            if([inputArray[0] isEqualToString:@"roll"]){
                [game rollDice];
            }else if([inputArray[0] isEqualToString:@"hold"]){
                [game holdDice:inputArray];
            }else if([inputArray[0] isEqualToString:@"unhold"]){
                [game unholdDice:inputArray];
            }else if([inputArray[0] isEqualToString:@"reset"]){
                [game resetDice];
            }else{
                NSLog(@"**Invalid command, try again.**");
            }
            
        }
    }
    return 0;
}
