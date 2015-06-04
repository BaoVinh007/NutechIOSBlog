//
//  ContentVC.m
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ContactVC.h"
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"

@interface ContactVC ()

@end

@implementation ContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.messageTextView.layer.borderWidth = .5f;
    self.messageTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.messageTextView.layer.cornerRadius = 8;

    _sendLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _sendLabel.numberOfLines = 0;
    self.scrollView.delegate = self;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.1);
    
    if([[appDelegate platformString]isEqualToString:@"iPhone 5S"])
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.4);
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.1);
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 4S"])
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)sendEmail:(id)sender {
    
    //Sender's name
    NSString *name = self.nameTF.text;
    
    // Email Subject
    NSString *emailTitle = self.subjectTF.text;
    // Email Content
    NSString *messageBody = self.messageTextView.text;
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"vinhdbn@gmail.com"];
    
    //BOOL *mySwitch = self.sendToYourSelf;
    
    //if(name isEqualToString:@"")
    
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    //[mc setBccRecipients:email];
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    if(self.sendToYourSelf.isOn)
    {
        //Email
        NSString *email = self.emailTF.text;
        NSArray *toBCC = [NSArray arrayWithObject:email];
        [mc setCcRecipients:toBCC];
    }
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
