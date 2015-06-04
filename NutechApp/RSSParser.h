//
//  RSSParser.h
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlogItems.h"

@interface RSSParser : NSObject<NSXMLParserDelegate>
@property(nonatomic,assign)BOOL insideItem;
@property(nonatomic,strong)NSMutableArray *blogItemArray;
@property(nonatomic,strong)NSMutableString *stringBuffer;
@property(nonatomic,strong)NSMutableArray *tutorialItemsArray;
@property(nonatomic,strong)BlogItems *blogItem;
@end
/*
 //@interface RSSParser : NSObject<NSXMLParserDelegate>
 //@property (nonatomic,assign)BOOL insideItem;
 //
 //@property(nonatomic,strong)NSMutableArray *feedItems;
 //
 //@property(nonatomic,strong)NSMutableString *stringBuffer;
 //
 //@property(nonatomic,strong)FeedItem *item;
 */