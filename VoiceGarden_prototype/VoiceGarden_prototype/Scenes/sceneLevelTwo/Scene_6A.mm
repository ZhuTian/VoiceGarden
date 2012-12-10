//
//  Scene_6A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//
#import "Scene_2.h"
#import "Scene_6A.h"
#import "GlobalVariable.h"
#define _fontSize 30

@implementation Scene_6A
+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_6A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_6A node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        NSString *fontName = @"Kristenalwaysnotsonormal";
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* background = [CCSprite spriteWithFile:@"life_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        label_1 = [CCLabelTTF labelWithString:@"I hear faint sounds in the garden." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 , size.height/2 - 100);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"It's  the echos of         returning." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 , size.height/2 - 160);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
		
        XXX = [CCMenuItemFont itemWithString:@"life" block:^(id sender){
            [GlobalVariable sharedInstance].isSlience = false;
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:2] withColor:ccWHITE]];
        }];
        [XXX setFontName:fontName];
        [XXX setFontSize:_fontSize];
        [XXX setPosition:ccp( size.width/2 + 50, size.height/2 - 160)];
        [XXX setIsEnabled:true];
        [XXX setColor:ccc3(100,100,100)];
        
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id actionXXX = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id actionXXX2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [XXX runAction: [CCSequence actions:actionXXX, actionXXX2, nil]];
        [XXX runAction:[CCRepeatForever actionWithAction:[CCSequence actions:actionXXX, actionXXX2, nil]]];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_4C sceneWithVar:2] withColor:ccWHITE]];
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            //
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:XXX, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
        if ([GlobalVariable sharedInstance].keyInThePocket == true) {
            CCSprite* keySprite = [CCSprite spriteWithFile:@"key.png"];
            keySprite.scale = 0.3;
            keySprite.position = ccp(900, 100);
            [self addChild:keySprite];
        }
        
	}
	return self;
}
@end
