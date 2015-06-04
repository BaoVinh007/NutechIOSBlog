//
//  QuizController.m
//  NutechApp
//
//  Created by Nutech Systems on 5/11/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "QuizController.h"

@interface QuizController ()

@end

@implementation QuizController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self runQuizQuery];
    _index = -1;
    
    [self setHiddenBools];
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setHiddenBools
{
    _answerTextView.hidden = YES;
    _explanationTextView.hidden = YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)runQuizQuery
{
    PFQuery *quizQuery = [PFQuery queryWithClassName:@"QuizItem"];
    [quizQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            _quizItems = objects;
            NSLog(@"%@", _quizItems);
        }
        else {
            NSLog(@"%@", error);
        }
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//-(void)handleParseArray
//{
//    _index++;
//
//    if(_index == _quizItems.count) {
//        _index = 0;
//    }
//
//    _quizObject = _quizItems[_index];
//}
//
//-(IBAction)showAnswer:(id)sender {
//    self.answerLabel.text = _quizObject[@"CorrectAnswer"];
//    self.explanationLabel.text = _quizObject[@"Explanation"];
//}
//
//-(IBAction)showQuestion:(id)sender {
//    [self handleParseArray];
//    self.questionLabel.text = _quizObject[@"Question"];
//}
/*
 - (IBAction)showNextItem:(id)sender {
 _index++;
 
 if(_index == _quizItems.count) {
 _index = 0;
 }
 
 PFObject *quizObject = _quizItems[_index];
 
 self.questionLabel.text = quizObject[@"Question"];
 self.answerLabel.text = quizObject[@"CorrectAnswer"];
 self.explanationLabel.text = quizObject[@"Explanation"];
 [self setHiddenBools];
 }
 
 - (IBAction)showAnswer:(id)sender {
 _explanationLabel.hidden = NO;
 _answerLabel.hidden = NO;
 }
 
 */

- (IBAction)questionBtn:(id)sender {
    //[self handleParseArray];
    self.questionTextView.text = _quizObject[@"Question"];
    _index++;
    
    if(_index == _quizItems.count) {
        _index = 0;
    }
    
    PFObject *quizObject = _quizItems[_index];
    
    self.questionTextView.text = quizObject[@"Question"];
    self.answerTextView.text = quizObject[@"CorrectAnswer"];
    self.explanationTextView.text = quizObject[@"Explanation"];
    [self setHiddenBools];
    
}
- (IBAction)answerBtn:(id)sender {
    _explanationTextView.hidden = NO;
    _answerTextView.hidden = NO;
}


@end
