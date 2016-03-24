//
//  Picture.h
//  HallOfFames
//
//  Created by James Rochabrun on 23-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Picture : NSObject
@property UIImage *frameImage;
@property UIColor *frameColor;

-(instancetype)initWithPath:(NSString *)imagePath
                 frameColor:(UIColor *)frameColor;

@end
