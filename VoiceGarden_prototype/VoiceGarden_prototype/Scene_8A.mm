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
        CCSprite* background = [CCSprite spriteWithFile:@"bg1.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        
        label_1 = [CCLabelTTF labelWithString:@"Life comes into my garden." fontName:fontName fontSize:48];
		label_1.position =  ccp( size.width /2 , size.height/2 - 40);
        label_1.color = ccc3(0, 0, 0);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"The garden is            again." fontName:fontName fontSize:48];
		label_2.position =  ccp( size.width /2 , size.height/2 - 100);
        label_2.color = ccc3(0, 0, 0);
		[self addChild: label_2];
        
        
        
        thriving = [CCMenuItemFont itemWithString:@"thriving" block:^(id sender){
            [GlobalVariable sharedInstance].isDesolate = false;
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_2 sceneWithVar:1] withColor:ccWHITE]];
        }];
        [thriving setFontName:fontName];
        [thriving setFontSize:48];
        [thriving setPosition:ccp( size.width/2 + 70, size.height/2 - 100)];
        [thriving setIsEnabled:true];
        [thriving setColor:ccc3(100, 100, 100)];
        
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:48];
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

-(void)updateScene
{
    ;
}
@end
