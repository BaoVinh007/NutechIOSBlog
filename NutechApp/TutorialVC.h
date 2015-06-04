//
//  TutorialVC.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TutorialItems.h"
#import "RSSTutorialParser.h"
#import "Tutorials.h"
#import "TutorialWebVC.h"

@interface TutorialVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tutorialTableView;
@property(strong,nonatomic)NSMutableArray *tutorialItems;
@property(strong,nonatomic)NSMutableData *buffer;
@property(strong,nonatomic)RSSTutorialParser *parserDelegate;
@property(strong,nonatomic)Tutorials *myTutorials;
@end
//@property (weak, nonatomic) IBOutlet UITableView *blogTableView;
//@property(strong,nonatomic)NSMutableData *buffer;
//@property(strong,nonatomic)RSSParser *parserDelegate;
//@property(strong,nonatomic)NSMutableArray *blogItems;
//@property(strong,nonatomic)Blog *myBlog;
