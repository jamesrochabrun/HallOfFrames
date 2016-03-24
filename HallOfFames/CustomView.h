//
//  CustomView.h
//  HallOfFames
//
//  Created by James Rochabrun on 23-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate
@optional
-(void)didTapColor:(UIButton *)button;
@end

@interface CustomView : UIView
@property (nonatomic,assign) id<CustomViewDelegate> delegate;

@end
