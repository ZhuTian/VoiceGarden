//
//  Scene_8A.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_8A.h"
#import "Scene_2.h"
#import "GlobalVariable.h"
#define _fontSize 30


@implementation Scene_8A
@synthesize sceneStatus;


+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_8A *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_8A node];
    layer.sceneStatus = _sceneType;
    [layer updateScene];
	
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
        
        [self initSprites];
        transitionTime = 2.0f;
        
        
        label_1 = [CCLabelTTF labelWithString:@"Life comes into my garden." fontName:fontName fontSize:_fontSize];
		label_1.position = ccp( size.width /2 - 450, size.height/2 + 100);
        label_1.color = ccc3(0, 0, 0);
        label_1.opacity = 0;
        label_1.anchorPoint = ccp(0, 0.5);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"The garden is            again." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 450, size.height/2 + 50);
        label_2.color = ccc3(0, 0, 0);
        label_2.opacity = 0;
        label_2.anchorPoint = ccp(0, 0.5);
		[self addChild: label_2];
        
        id label1Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_1 runAction:label1Action];
        id label2Action = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        [label_2 runAction:label2Action];
        
        
        
        thriving = [CCMenuItemFont itemWithString:@"thriving" block:^(id sender){
            [GlobalVariable sharedInstance].isDesolate = false;
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [thriving setFontName:fontName];
        [thriving setFontSize:_fontSize];
        [thriving setPosition:ccp( size.width/2 - 215, size.height/2 + 50)];
        [thriving setIsEnabled:true];
        [thriving setColor:ccc3(100, 100, 100)];
        thriving.opacity = 0;
        
        id fadein = [CCFadeTo actionWithDuration:transitionTime opacity:255];
        id move = [CCMoveBy actionWithDuration:0.35 position:ccp(0, 5)];
        id actionTh = [CCEaseIn actionWithAction:move rate:1];
        id move2 = [CCMoveBy actionWithDuration:0.35 position:ccp(0, -5)];
        id actionTh2 = [CCEaseOut actionWithAction:move2 rate:1];
        
        [thriving runAction: [CCSequence actions:fadein, actionTh, actionTh2, nil]];
        [thriving runAction:[CCRepeatForever actionWithAction:[CCSequence actions:actionTh, actionTh2, nil]]];
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItem *menu = [CCMenu menuWithItems:thriving, nil];
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

-(void)initSprites
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    //Add common background
    background = [CCSprite spriteWithFile:@"tutorial_bg.png"];
    background.position = ccp(size.width/2, size.height/2);
    [self addChild: background z:BACKGROUND_Z];
    
    
    door = [CCSprite spriteWithFile:@"door.png"];
    door.position = ccp(size.width/2, size.height/2);
    door.scale = 1.0f;
    [self addChild: door z:SCENE_Z];
    
    
}

-(void)updateScene
{
    ;
}
@end
