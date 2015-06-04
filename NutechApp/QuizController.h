//
//  QuizController.h
//  NutechApp
//
//  Created by Nutech Systems on 5/11/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface QuizController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UITextView *answerTextView;
@property (strong, nonatomic) IBOutlet UITextView *explanationTextView;

@property (strong,nonatomic)PFObject *quizObject;
@property(strong,nonatomic)NSArray *quizItems;
@property(nonatomic)int index;

@end
