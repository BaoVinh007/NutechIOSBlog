//
//  RSSTutorialParser.h
//  NutechApp
//
//  Created by Nutech Systems on 5/4/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TutorialItems.h"

@interface RSSTutorialParser : NSObject<NSXMLParserDelegate>
@property(nonatomic,assign)BOOL insideItem;
@property(nonatomic,strong)NSMutableArray *tutItemArray;
@property(nonatomic,strong)NSMutableString *stringBuffer;
@property(nonatomic,strong)NSMutableArray *tutorialItemsArray;
@property(nonatomic,strong)TutorialItems *tutItem;
@end
/*
 @interface RSSParser : NSObject<NSXMLParserDelegate>
 @property(nonatomic,assign)BOOL insideItem;
 @property(nonatomic,strong)NSMutableArray *blogItemArray;
 @property(nonatomic,strong)NSMutableString *stringBuffer;
 @property(nonatomic,strong)NSMutableArray *tutorialItemsArray;
 @property(nonatomic,strong)BlogItems *blogItem;
 @end
 
 
 */