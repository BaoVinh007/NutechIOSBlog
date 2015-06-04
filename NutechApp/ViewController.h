//
//  ViewController.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

//- (IBAction)blogBtn:(id)sender;
//- (IBAction)tutorialBtn:(id)sender;
//- (IBAction)contentBtn:(id)sender;
//- (IBAction)aboutBtn:(id)sender;
//- (IBAction)quizBtn:(id)sender;

@property (strong, nonatomic) UIButton *blogButton;
@property (strong, nonatomic) UIButton *tutorialButton;
@property (strong, nonatomic) UIButton *contactButton;
@property (strong, nonatomic) UIButton *aboutButton;
@property (strong, nonatomic) UIButton *quizButton;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

