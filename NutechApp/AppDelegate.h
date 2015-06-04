//
//  AppDelegate.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#define IS_IPHONE6 ([[UIDevice currentDevice] platformString])

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (NSString *) platform;
- (NSString *) platformString;

@end

