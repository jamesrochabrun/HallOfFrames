//
//  Picture.m
//  HallOfFames
//
//  Created by James Rochabrun on 23-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Picture.h"

@implementation Picture

-(instancetype)initWithPath:(NSString *)imagePath
                 frameColor:(UIColor *)frameColor {
    self = [super init];
    if (self) {
        self.frameImage = [UIImage imageNamed:imagePath];
        self.frameColor = frameColor;
    }
    return self;
}

@end
