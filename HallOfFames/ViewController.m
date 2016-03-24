//
//  ViewController.m
//  HallOfFames
//this is james branch
//  Created by James Rochabrun on 23-03-16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "ViewController.h"
#import "PictureCollectionViewCell.h"
#import "Picture.h"
#import "CustomView.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CustomViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *picturesPath;
@property NSMutableArray *pictures;
@property (weak, nonatomic) IBOutlet UIImageView *frameImageView;
@property NSIndexPath *tappedIndexPath;

@property CustomView *popUpView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.picturesPath = @[@"image1", @"image2",@"image3", @"image4",@"image5"];
//    
//    //this stupid line
//    self.pictures = [[NSMutableArray alloc] init];
//
//    for (int i = 0; i < self.picturesPath.count; i++) {
//        UIImage *image = [UIImage imageNamed:self.picturesPath[i]];
//        [self.pictures addObject:image ];
//    }

    self.pictures = [[NSMutableArray alloc] init];
    
    for (int i = 1; i < 6; i++) {
        //Picture *picture = [[Picture alloc]initWithPath:@"image1" frameColor:[UIColor blueColor]];
        Picture *picture = [[Picture alloc] initWithPath:[NSString stringWithFormat:@"image%i",i] frameColor:[UIColor blueColor]];
        [self.pictures addObject:picture];
    }
    
    self.popUpView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    self.popUpView.delegate = self;

    [self.view addSubview:self.popUpView];
    [self.view sendSubviewToBack:self.popUpView];


    
    NSLog(@"%@", self.pictures);

}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //create a custom object of class PictureCollectionView
    //in PictureCollection, it contains a frameImageView property
    PictureCollectionViewCell *pictureCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    //set the custom object to show the image at from our self.pictures array at index path
    //[pictureCell.frameImageView setImage:[self.pictures objectAtIndex:indexPath.row]];
    [pictureCell.frameImageView setImage:[[self.pictures objectAtIndex:indexPath.row] frameImage]];
    
    //set frame color to the color inside each picture object
    //this sets the color by default.
    pictureCell.backgroundColor = [[self.pictures objectAtIndex:indexPath.row] frameColor];

    //may not need this code
    //add the imageview to the cell
    //[pictureCell addSubview:self.frameImageView];
    
    //return the cell
    return pictureCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//        PictureCollectionViewCell *pictureCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
//    pictureCell.backgroundColor = [UIColor purpleColor];
//    [[collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor orangeColor]];
//    [self.collectionView reloadData];
    
    
    //so we need to create a new object to store each object and acces to its property
    Picture *picture = [self.pictures objectAtIndex:indexPath.row];
    picture.frameColor = [UIColor orangeColor];
    [self.collectionView reloadData];

    NSLog(@"%li", (long)indexPath.row);
    //this is the delegate , customView is a UIview 
//    CustomView *popUpView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:indexPath.row];
    
   // CustomView *popUpView = [[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil];
    
    // from this stackoverflow webpage: http://stackoverflow.com/questions/7814928/how-to-load-a-xib-file-in-a-uiview
//    CustomView *popUpView = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    //[self.view addSubview:popUpView];
    
    
    //popUpView.delegate = self;
    //self.popUpView.hidden = NO;

    [self.view bringSubviewToFront:self.popUpView];
    
    self.tappedIndexPath = indexPath;
    
    
}

-(void)didTapColor:(UIButton *)button
{
   [self.view sendSubviewToBack:self.popUpView];
    //self.popUpView.hidden = YES;
    
    
    Picture *picture = [self.pictures objectAtIndex:self.tappedIndexPath.row];
    NSLog(@"%lu, %@",(long)self.tappedIndexPath.row, button.titleLabel.text);
    if([button.titleLabel.text isEqualToString:@"Red"]){
        picture.frameColor = [UIColor redColor];
    } else if([button.titleLabel.text isEqualToString:@"Green"]){
        picture.frameColor = [UIColor greenColor];
    } else if ([button.titleLabel.text isEqualToString:@"Blue"]) {
        picture.frameColor = [UIColor blueColor];
    }
    
    
    
    [self.collectionView reloadData];

    
  
}


@end











