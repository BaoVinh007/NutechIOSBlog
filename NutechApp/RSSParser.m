//
//  RSSParser.m
//  NutechApp
//
//  Created by Nutech Systems on 5/1/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "RSSParser.h"

@implementation RSSParser
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"Parsing started");
    _blogItemArray = [[NSMutableArray alloc]init];
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"Parsing ended");


}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"item"]) {
        _insideItem = YES;
        
        _blogItem = [[BlogItems alloc]init];
    }
    if(_insideItem && [elementName isEqualToString:@"title"]){
        //create the string buffer so that we can capture the titles characters
        _stringBuffer = [[NSMutableString alloc]init];
        
    }
    if(_insideItem &&[elementName isEqualToString:@"link"]){
        _stringBuffer = [[NSMutableString alloc]init];
        
    }
    
}
//found at end element
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if([elementName isEqualToString:@"item"]){
        //If I reach the end item set the inside item to no and add object to the array
        //only need 1 did end element if statement and this is for the starting of the xml
        //parser
        _insideItem = NO;
        
        [_blogItemArray addObject:_blogItem];
        
    }
    //if I have found the ending title set values to the object
    if(_insideItem &&[elementName isEqualToString:@"title"]){
        NSLog(@"this is the title I have found %@",_stringBuffer);
        _blogItem.title = _stringBuffer;
        _stringBuffer = nil;
    }
    if(_insideItem &&[elementName isEqualToString:@"link"]){
        NSLog(@"This is the link that I have found %@",_stringBuffer);
        _blogItem.link = _stringBuffer;
        _stringBuffer = nil;
        
    }
    
    
}
//called start and end element
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(_stringBuffer != nil){
        //append characters and store them to them string buffer
        [_stringBuffer appendString:string];
        
        
    }
}
@end
/*
  //found at end element
 -(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
 
 if([elementName isEqualToString:@"item"]){
 //If I reach the end item set the inside item to no and add object to the array
 //only need 1 did end element if statement and this is for the starting of the xml
 //parser
 _insideItem = NO;
 
 [_feedItems addObject:_item];
 
 }
 //if I have found the ending title set values to the object
 if(_insideItem &&[elementName isEqualToString:@"title"]){
 NSLog(@"this is the title I have found %@",_stringBuffer);
 _item.title = _stringBuffer;
 _stringBuffer = nil;
 }
 if(_insideItem &&[elementName isEqualToString:@"link"]){
 NSLog(@"This is the link that I have found %@",_stringBuffer);
 _item.link = _stringBuffer;
 _stringBuffer = nil;
 
 }
 
 
 }
 //called start and end element
 -(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
 if(_stringBuffer != nil){
 //append characters and store them to them string buffer
 [_stringBuffer appendString:string];
 
 
 }
 
 
 }
 
 
 
 */