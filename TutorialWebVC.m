//
//  TutorialWebView.m
//  NutechApp
//
//  Created by Nutech Systems on 5/4/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "TutorialWebVC.h"

@interface TutorialWebVC ()

@end

@implementation TutorialWebVC
/*
 // Do any additional setup after loading the view.
 NSString *urlPath = _link;
 NSURL *url = [NSURL URLWithString:urlPath];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 [_webView loadRequest:request];

 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_link);

    NSString *urlPath = _link;
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_tutorialWebView loadRequest:request];
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
