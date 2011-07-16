//
//  imageViewViewController.h
//  imageView
//
//  Created by Hung Phi on 7/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageViewViewController : UIViewController 
    <UIScrollViewDelegate, UIActionSheetDelegate>
{
    UISlider *sliderValue;
    IBOutlet UIScrollView *scrollImage;
    UIImageView *imageView;
    UIImage *imageLoad;
    UIImage *imageFilter;
    
    //Border button : 
    CALayer * buttonLayer;
    UIButton *buttonNormal;
    UIButton *buttonGray;
    UIButton *buttonSepia;
    UIButton *buttonNored;
    UIButton *buttonQuartz;
    UIButton *buttonHue;
}

- (UIImage *)makeHue:(UIImage *)image;
- (UIImage *)makeQuartz:(UIImage *)image; 
- (UIImage *)makeNored:(UIImage *)image;
- (UIImage*)makeSepiaScale:(UIImage*)image;
- (UIImage*) makeGraycale:(UIImage*)image;


@property (nonatomic, retain) UIImage *imageLoad;
@property (nonatomic, retain) UIImage *imageFilter;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollImage;

@end
