//
//  TutorialWebView.h
//  NutechApp
//
//  Created by Nutech Systems on 5/4/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialWebVC : UIViewController
@property(strong,nonatomic)NSString *link;
@property (weak, nonatomic) IBOutlet UIWebView *tutorialWebView;

@end
