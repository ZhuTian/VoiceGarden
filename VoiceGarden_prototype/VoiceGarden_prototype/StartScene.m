//
//  Scene_1.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-6.
//
//

#import "StartScene.h"
#import "Scene_1.h"

@implementation StartScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartScene *layer = [StartScene node];
	
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
        CCSprite* background = [CCSprite spriteWithFile:@"start_bg.png"];
        background.position = ccp(size.width/2, size.height/2);
        
        int _fontSize = 32;
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"I am in a            ." fontName:fontName fontSize:_fontSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 - 100, size.height/2 - 50);
        label.color = ccc3(0, 0, 0);
        label.anchorPoint = ccp(0, 0.5);
        //[self addChild:label];
        
        
        
        CCMenuItemFont *button_tutorial = [CCMenuItemFont itemWithString:@"Tutorial" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [button_tutorial setFontName:fontName];
        [button_tutorial setFontSize:_fontSize];
        [button_tutorial setPosition:ccp( 150, 150)];
        [button_tutorial setColor:ccc3(0,0,0)];
        
        CCMenuItemFont *button_level1 = [CCMenuItemFont itemWithString:@"Level 1" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [button_level1 setFontName:fontName];
        [button_level1 setFontSize:_fontSize];
        [button_level1 setPosition:ccp( 300, 150)];
        [button_level1 setColor:ccc3(0,0,0)];
        
        CCMenuItemFont *button_level2 = [CCMenuItemFont itemWithString:@"Level 2" block:^(id sender){
            //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [button_level2 setFontName:fontName];
        [button_level2 setFontSize:_fontSize];
        [button_level2 setPosition:ccp( 450, 150)];
        [button_level2 setColor:ccc3(0,0,0)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:button_tutorial, button_level1, button_level2, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}



@end
