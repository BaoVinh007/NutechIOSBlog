//
//  ContentVC.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ContactVC : UIViewController<MFMailComposeViewControllerDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *subjectTF;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UISwitch *sendToYourSelf;
@property (strong, nonatomic) IBOutlet UILabel *sendLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)sendEmail:(id)sender;
@end
