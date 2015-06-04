//
//  BlogVC.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Blog.h"
#import "BlogItems.h"
#import "RSSParser.h"
#import "BlogWebViewVC.h"

/*
 
 #import <UIKit/UIKit.h>
 #import "Feed.h"
 #import "RSSParser.h"
 #import "FeedItem.h"
 #import "FeedWebViewVC.h"
 */


@interface BlogVC : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *blogTableView;
@property(strong,nonatomic)NSMutableData *buffer;
@property(strong,nonatomic)RSSParser *parserDelegate;
@property(strong,nonatomic)NSMutableArray *blogItems;
@property(strong,nonatomic)Blog *myBlog;

@end
/*
@interface FeedVC : UIViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate,UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)NSDictionary *feedListDictionary;
@property(strong,nonatomic)Feed *myFeed;
@property (strong,nonatomic)NSMutableData *buffer;
@property(strong,nonatomic)RSSParser *parserDelegate;
@property(strong,nonatomic)NSMutableArray *feedItems;
@property (weak, nonatomic) IBOutlet UITableView *feedVCtTV;

- (IBAction)doneBtn:(id)sender;

@end
*/