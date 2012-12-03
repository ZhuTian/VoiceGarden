//
//  Scene_5D.m
//  VoiceGarden_prototype
//
//  Created by Tian Zhu on 12-11-13.
//
//

#import "Scene_5D.h"
#import "Scene_6B.h"

@implementation Scene_5D
@synthesize sceneStatus;

+(CCScene *) sceneWithVar: (int)_sceneType
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	// 'layer' is an autorelease object.
	Scene_5D *layer;
    //layer.sceneType = _sceneType;
    layer= [Scene_5D node];
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
        CCSprite* background = [CCSprite spriteWithFile:@"onMyWay_bg.jpg"];
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        int _fontSize = 30;
        
        label_1 = [CCLabelTTF labelWithString:@"     alone decide my path." fontName:fontName fontSize:_fontSize];
		label_1.position =  ccp( size.width /2 - 300, size.height/2 + 100);
        label_1.color = ccc3(0, 0, 0);
        label_1.anchorPoint = ccp(0, 0.5);
		[self addChild: label_1];
        
        label_2 = [CCLabelTTF labelWithString:@"The lily has overtaken the pond." fontName:fontName fontSize:_fontSize];
		label_2.position =  ccp( size.width /2 - 300, size.height/2 + 50);
        label_2.color = ccc3(0, 0, 0);
        label_2.anchorPoint = ccp(0, 0.5);
		[self addChild: label_2];
        
        label_3 = [CCLabelTTF labelWithString:@"     want to see what's hiding." fontName:fontName fontSize:_fontSize];
		label_3.position =  ccp( size.width /2 - 300, size.height/2 - 0);
        label_3.color = ccc3(0, 0, 0);
        label_3.anchorPoint = ccp(0, 0.5);
        [self addChild:label_3];
        
        label_4 = [CCLabelTTF labelWithString:@"     need to see for myself" fontName:fontName fontSize:_fontSize];
		label_4.position =  ccp( size.width /2 - 300, size.height/2 - 50);
        label_4.color = ccc3(0, 0, 0);
        label_4.anchorPoint = ccp(0, 0.5);
		[self addChild:label_4];
		
        I_1 = [CCMenuItemFont itemWithString:@"I" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_6B sceneWithVar:1] withColor:ccWHITE]];
        }];
        [I_1 setFontName:fontName];
        [I_1 setFontSize:_fontSize];
        [I_1 setPosition:ccp( size.width/2 - 230, size.height/2 + 100)];
        [I_1 setIsEnabled:false];
        [I_1 setColor:ccc3(0,0,0)];
        
        I_2 = [CCMenuItemFont itemWithString:@"I" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_6B sceneWithVar:1] withColor:ccWHITE]];
        }];
        [I_2 setFontName:fontName];
        [I_2 setFontSize:_fontSize];
        [I_2 setPosition:ccp( size.width/2 - 280, size.height/2 - 0)];
        [I_2 setIsEnabled:false];
        [I_2 setColor:ccc3(0,0,0)];
        
        I_3 = [CCMenuItemFont itemWithString:@"I" block:^(id sender){
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[Scene_6B sceneWithVar:1] withColor:ccWHITE]];
        }];
        [I_3 setFontName:fontName];
        [I_3 setFontSize:_fontSize];
        [I_3 setPosition:ccp( size.width/2 - 230, size.height/2 - 50)];
        [I_3 setIsEnabled:false];
        [I_3 setColor:ccc3(0,0,0)];
        
        
        CCMenuItemFont *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            ;
        }];
        [back setFontName:fontName];
        [back setFontSize:_fontSize];
        [back setPosition:ccp( 70, 30)];
        [back setColor:ccc3(100,100,100)];
        
        CCMenuItemFont *action = [CCMenuItemFont itemWithString:@"Action" block:^(id sender){
            self.sceneStatus = 2;
            [self updateScene];
        }];
        [action setFontName:fontName];
        [action setFontSize:_fontSize];
        [action setPosition:ccp( size.width - 100, 30)];
        [action setColor:ccc3(100,100,100)];
        
        
        CCMenuItem *menu = [CCMenu menuWithItems:I_1, I_2, I_3, action, nil];
        //		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		//[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( 0, 0)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

-(void)updateScene
{
    if(self.sceneStatus == 1)
    {
        ;
    }
    else
    {
        [I_1 setIsEnabled:true];
        [I_1 setColor:ccc3(100,100,100)];
        [I_2 setIsEnabled:true];
        [I_2 setColor:ccc3(100,100,100)];
        [I_3 setIsEnabled:true];
        [I_3 setColor:ccc3(100,100,100)];
    }
}
@end
