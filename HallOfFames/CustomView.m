//
//  CustomView.m
//  HallOfFames
//
//  Created by James Rochabrun on 23-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)changeColorButton:(UIButton *)sender {
    [self.delegate didTapColor:sender];
}


@end
