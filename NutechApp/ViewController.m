//
//  ViewController.m
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

CGSize contentSize;

static float verticalSpacer = 100;
static float buttonYForTutIphone6 = 192;

#pragma mark - iPhone5 layout
static float buttonXForIphone5 = 94.5;
static float buttonWidthIphone5 = 131;
static float buttonHeightIphone5 = 71;

#pragma mark - iPhone6 layout
static float buttonXForIphone6 = 122;
static float buttonWidth = 131;
static float buttonHeight = 71;

#pragma mark - iPhone6Plus layout
static float buttonXForPlus = 133.5;
static float buttonWidthPlus = 147;
static float buttonHeightPlus = 78;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //[self.view addSubview:_scrollView];
    self.view = _scrollView;
    self.scrollView.delegate = self;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
        //call layout method for Iphone 6 Plus
        [self layoutForIphone6PlusWithContentSize:self.scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
       //call layout method for Iphone 6 Plus
        [self layoutForIphone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
        [self layoutForIphone4SWithContenSize:self.scrollView.contentSize];

    }
    [self layoutForIphone6];
}

-(void)layoutForIphone4SWithContenSize:(CGSize)contentSize
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
    [self layoutForIphone5WithContentSize:contentSize];
}

-(void)layoutForIphone5WithContentSize:(CGSize)contentSize
{
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _tutorialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tutorialButton.frame = CGRectMake(buttonXForIphone5, buttonYForTutIphone6, buttonWidthIphone5, buttonHeightIphone5);
    _tutorialButton.layer.cornerRadius = 10;
    [_tutorialButton setClipsToBounds:YES];
    [_tutorialButton setTitle:@"Tutorial" forState:UIControlStateNormal];
    [_tutorialButton addTarget:self action:@selector(tutorialBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_tutorialButton];
    
    _blogButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _blogButton.frame = CGRectMake(buttonXForIphone5, _tutorialButton.frame.origin.y+verticalSpacer+buttonHeightIphone5, buttonWidthIphone5, buttonHeightIphone5);
    _blogButton.layer.cornerRadius = 10;
    [_blogButton setClipsToBounds:YES];
    [_blogButton setTitle:@"Blog" forState:UIControlStateNormal];
    [_blogButton addTarget:self action:@selector(blogBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_blogButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_blogButton];
    
    _aboutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _aboutButton.frame = CGRectMake(buttonXForIphone5, _blogButton.frame.origin.y+buttonHeightIphone5+verticalSpacer, buttonWidthIphone5, buttonHeightIphone5);
    _aboutButton.layer.cornerRadius = 10;
    [_aboutButton setClipsToBounds:YES];
    [_aboutButton setTitle:@"About" forState:UIControlStateNormal];
    [_aboutButton addTarget:self action:@selector(aboutBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_aboutButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_aboutButton];
    
    _contactButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _contactButton.frame = CGRectMake(buttonXForIphone5, _aboutButton.frame.origin.y+buttonHeightIphone5+verticalSpacer, buttonWidthIphone5, buttonHeightIphone5);
    _contactButton.layer.cornerRadius = 10;
    [_contactButton setClipsToBounds:YES];
    [_contactButton setTitle:@"Contact Us" forState:UIControlStateNormal];
    [_contactButton addTarget:self action:@selector(contactBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_contactButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_contactButton];
    
    _quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _quizButton.frame = CGRectMake(buttonXForIphone5, _contactButton.frame.origin.y+buttonHeightIphone5+verticalSpacer, buttonWidthIphone5, buttonHeightIphone5);
    _quizButton.layer.cornerRadius = 10;
    [_quizButton setClipsToBounds:YES];
    [_quizButton setTitle:@"Quiz" forState:UIControlStateNormal];
    [_quizButton addTarget:self action:@selector(quizBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_quizButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_quizButton];
}

-(void)layoutForIphone6
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [self.view addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(67.5, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [self.view addSubview:_logoView];
    
    _tutorialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tutorialButton.frame = CGRectMake(buttonXForIphone6, buttonYForTutIphone6, buttonWidth, buttonHeight);
    _tutorialButton.layer.cornerRadius = 10;
    [_tutorialButton setClipsToBounds:YES];
    [_tutorialButton setTitle:@"Tutorial" forState:UIControlStateNormal];
    [_tutorialButton addTarget:self action:@selector(tutorialBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_tutorialButton];
    
    _blogButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _blogButton.frame = CGRectMake(buttonXForIphone6, _tutorialButton.frame.origin.y+verticalSpacer+buttonHeight, buttonWidth, buttonHeight);
    _blogButton.layer.cornerRadius = 10;
    [_blogButton setClipsToBounds:YES];
    [_blogButton setTitle:@"Blog" forState:UIControlStateNormal];
    [_blogButton addTarget:self action:@selector(blogBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_blogButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_blogButton];
    
    _aboutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _aboutButton.frame = CGRectMake(buttonXForIphone6, _blogButton.frame.origin.y+buttonHeight+verticalSpacer, buttonWidth, buttonHeight);
    _aboutButton.layer.cornerRadius = 10;
    [_aboutButton setClipsToBounds:YES];
    [_aboutButton setTitle:@"About" forState:UIControlStateNormal];
    [_aboutButton addTarget:self action:@selector(aboutBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_aboutButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_aboutButton];
    
    _contactButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _contactButton.frame = CGRectMake(buttonXForIphone6, _aboutButton.frame.origin.y+buttonHeight+verticalSpacer, buttonWidth, buttonHeight);
    _contactButton.layer.cornerRadius = 10;
    [_contactButton setClipsToBounds:YES];
    [_contactButton setTitle:@"Contact Us" forState:UIControlStateNormal];
    [_contactButton addTarget:self action:@selector(contactBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_contactButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_contactButton];
    
    _quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _quizButton.frame = CGRectMake(buttonXForIphone6, _contactButton.frame.origin.y+buttonHeight+verticalSpacer, buttonWidth, buttonHeight);
    _quizButton.layer.cornerRadius = 10;
    [_quizButton setClipsToBounds:YES];
    [_quizButton setTitle:@"Quiz" forState:UIControlStateNormal];
    [_quizButton addTarget:self action:@selector(quizBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_quizButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_quizButton];
}

-(void)layoutForIphone6PlusWithContentSize:(CGSize)contentSize
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(87, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _tutorialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tutorialButton.frame = CGRectMake(buttonXForPlus, buttonYForTutIphone6, buttonWidthPlus, buttonHeightPlus);
    _tutorialButton.layer.cornerRadius = 10;
    [_tutorialButton setClipsToBounds:YES];
    [_tutorialButton setTitle:@"Tutorial" forState:UIControlStateNormal];
    [_tutorialButton addTarget:self action:@selector(tutorialBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_tutorialButton];
    
    _blogButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _blogButton.frame = CGRectMake(buttonXForPlus, _tutorialButton.frame.origin.y+verticalSpacer+buttonHeightPlus, buttonWidthPlus, buttonHeightPlus);
    _blogButton.layer.cornerRadius = 10;
    [_blogButton setClipsToBounds:YES];
    [_blogButton setTitle:@"Blog" forState:UIControlStateNormal];
    [_blogButton addTarget:self action:@selector(blogBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_blogButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_blogButton];
    
    _aboutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _aboutButton.frame = CGRectMake(buttonXForPlus, _blogButton.frame.origin.y+buttonHeightPlus+verticalSpacer, buttonWidthPlus, buttonHeightPlus);
    _aboutButton.layer.cornerRadius = 10;
    [_aboutButton setClipsToBounds:YES];
    [_aboutButton setTitle:@"About" forState:UIControlStateNormal];
    [_aboutButton addTarget:self action:@selector(aboutBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_aboutButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_aboutButton];
    
    _contactButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _contactButton.frame = CGRectMake(buttonXForPlus, _aboutButton.frame.origin.y+buttonHeightPlus+verticalSpacer, buttonWidthPlus, buttonHeightPlus);
    _contactButton.layer.cornerRadius = 10;
    [_contactButton setClipsToBounds:YES];
    [_contactButton setTitle:@"Contact Us" forState:UIControlStateNormal];
    [_contactButton addTarget:self action:@selector(contactBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_contactButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_contactButton];
    
    _quizButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _quizButton.frame = CGRectMake(buttonXForPlus, _contactButton.frame.origin.y+buttonHeightPlus+verticalSpacer, buttonWidthPlus, buttonHeightPlus);
    _quizButton.layer.cornerRadius = 10;
    [_quizButton setClipsToBounds:YES];
    [_quizButton setTitle:@"Quiz" forState:UIControlStateNormal];
    [_quizButton addTarget:self action:@selector(quizBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_quizButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_quizButton];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
//    if([[appDelegate platformString]isEqualToString:@"iPhone 6"] || [[appDelegate platformString]isEqualToString:@"Simulator"])
//    {
//        _tutorialButton.frame = CGRectMake(_tutorialButton.frame.origin.x-19, _tutorialButton.frame.origin.y, _tutorialButton.frame.size.width, _tutorialButton.frame.size.height);
//    }
    
    if([[appDelegate platformString]isEqualToString:@"iPhone 5S"])
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.4);
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 4S"])
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
    }
    
    else
    {
        self.scrollView = nil;
    }
    
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewDidAppear:(BOOL)animated{
    

}
-(void)awakeFromNib{

    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)blogBtn:(id)sender {
    [self performSegueWithIdentifier:@"toBlog" sender:self];
}

- (void)tutorialBtn:(id)sender {
    [self performSegueWithIdentifier:@"toTuts" sender:self];
}

- (void)contactBtn:(id)sender {
    [self performSegueWithIdentifier:@"toContact" sender:self];
}

- (IBAction)aboutBtn:(id)sender {
    [self performSegueWithIdentifier:@"toAbout" sender:self];
}

- (IBAction)quizBtn:(id)sender {
    [self performSegueWithIdentifier:@"toQuiz" sender:self];
}
@end
