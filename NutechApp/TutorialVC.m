//
//  TutorialVC.m
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//
#import<Foundation/Foundation.h>

#import "TutorialVC.h"

@interface TutorialVC ()

@end

@implementation TutorialVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.tutorialTableView.delegate = self;
    self.tutorialTableView.dataSource = self;
    
    Tutorials *tut1 = [[Tutorials alloc]init];
    tut1.url = @"http://iphone.keyvisuals.com/feed/";
    
    _parserDelegate = [[RSSTutorialParser alloc]init];
    NSString *baseURL = tut1.url;
    NSURL *url = [NSURL URLWithString:baseURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection failed with error %@", error);
    
}
//call this method if the response is received
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"did recieve response from server");
    _buffer = [[NSMutableData alloc]init];
}
//did recieve data is called while the file is downloaded
//maybe called multiple times depends on the rate the data is recieved
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"Received data from the server");
    //append the received data to the buffer
    [_buffer appendData:data];
}
//called after the wholed data is downloaded
//and background thread comes to end
-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    //parse in this method when using an automatic background thread
    NSLog(@"Downloaded the whole data from the server");
    NSString* str = [[NSString alloc]initWithData:_buffer encoding:NSUTF8StringEncoding];
    NSLog(@"Data = \n %@",str);
    
    //_feedVCTextView.text = str;
    
    
    //Create the parser
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:_buffer];
    
    //attach the delegate to parser
    parser.delegate = _parserDelegate;
    
    //start parsing
    [parser parse];
    
    _tutorialItems = _parserDelegate.tutorialItemsArray;
    [_tutorialTableView reloadData];
    //
    //    NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:_buffer options:NSJSONReadingMutableContainers error:nil];
    //    NSNumber *val = [obj objectForKey:@"Mid"];
    //    _displayLbl.text = [val stringValue];
    
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    /*
     NSDictionary *pacificDict = [_NBADivisions objectForKey:@"PacificDivision"];
     NSArray *keys = [pacificDict allKeys];
     return  keys.count;
     */
    return _tutorialItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tutCell"];
    
    
    
    
    //    Feed *f1 = [_feedListArray objectAtIndex:indexPath.row];
    //    cell.textLabel.text = f1.name;
    //BlogItems *BI1 = [_blogItems objectAtIndex:indexPath.row];
    TutorialItems *TI1 = [_tutorialItems objectAtIndex:indexPath.row];
    cell.textLabel.text =TI1.title;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //    //country name selected
    //    NSString* countryName = [_countries objectAtIndex:indexPath.row];
    //
    //    //create the wiki view controller
    //    _wikivc = [[WikiVC alloc] init];
    //
    //    //send the countryname to the wiki view controller
    //    _wikivc.countryName = countryName;
    //
    //    //push the wiki view controller on the navigation stack
    //    [self.navigationController pushViewController:_wikivc animated:YES];
    //
    //
    //    //    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"CountryInfoApp" message:countryName delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    //    //
    //    //    [alert show];
    //[segue.identifier isEqualToString:@"myWebviewSeque"];
    //EnterStudentsController *esvc = (EnterStudentsController*)segue.destinationViewController;
//    BlogWebViewVC *bwvVC = (BlogWebViewVC*)segue.destinationViewController;
//    NSIndexPath *indexPath = [_blogTableView indexPathForSelectedRow];
//    BlogItems *bItemObject = [_blogItems objectAtIndex:indexPath.row];
//    bwvVC.link = bItemObject.link;
    TutorialWebVC *ttwv = (TutorialWebVC*)segue.destinationViewController;
    NSIndexPath *indexPath = [_tutorialTableView indexPathForSelectedRow];
    TutorialItems *tItemObject = [_tutorialItems objectAtIndex:indexPath.row];
    ttwv.link = tItemObject.link;
    
    
    
    
    
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
