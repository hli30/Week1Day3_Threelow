//
//  InputHandler.m
//  Threelow
//
//  Created by Harry Li on 2017-05-31.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

-(NSString *)inputForPrompt:(NSString *)promptString{
    char input[255];
    
    NSLog(@"%@", promptString);
    fgets(input, 255, stdin);
    
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
}

@end
